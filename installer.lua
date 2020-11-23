-- MD5:dcf89eb2d18ddfea0ca68ceef1fbddb7
fs.makeDir("/cc.servebeer.com")
fs.makeDir("/cc.servebeer.com/api")
shell.setDir("/cc.servebeer.com/")

shell.run("wget", "http://cc.servebeer.com/startup", "/startup")
shell.run("wget", "http://cc.servebeer.com/scripts/api/json.lua", "/cc.servebeer.com/api/json.lua")

os.loadAPI("/cc.servebeer.com/api/json.lua")

local metaHttp = http.get("http://cc.servebeer.com/meta/")
meta = json.parse(metaHttp.readAll())
metaHttp.close()

for _, script in ipairs(meta["scripts"]) do
  shell.run("wget", "http://cc.servebeer.com/scripts/" .. script.file)
end

shell.run("/startup")
