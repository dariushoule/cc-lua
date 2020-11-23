from glob import glob

import uvicorn
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import PlainTextResponse

app = FastAPI()


@app.get('/install', response_class=PlainTextResponse)
def installer():
    with open('./scripts/sync.lua') as f:
        return f.read()


@app.get('/startup', response_class=PlainTextResponse)
def startup():
    with open('./startup_bootstrapper.lua') as f:
        return f.read()


@app.get('/meta')
def meta():
    m = {
        "scripts": []
    }

    for file in glob('scripts/*.lua'):
        with open(file, 'r') as f:
            script = f.read()

        md5_line = script.partition("\n")[0]
        m["scripts"].append({
            "file": file,
            "md5": md5_line.split(':')[1]
        })

    return m


app.mount("/scripts", StaticFiles(directory="scripts"), name="scripts")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
