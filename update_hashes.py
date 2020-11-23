from glob import glob
from hashlib import md5

for file in glob('scripts/api/*.lua') + glob('scripts/*.lua') + glob('*.lua'):
    with open(file, 'r') as f:
        script = f.read()

    if "-- MD5:" not in script:
        script = f"-- MD5:{md5(script.encode('utf-8')).hexdigest()}\n{script}"
    else:
        md5_line, _, source = script.partition("\n")
        script.replace(md5_line.split(':')[1], md5(source.encode('utf-8')).hexdigest())

    print(f'{file}: hash updated.')

    with open(file, 'w') as f:
        f.write(script)
