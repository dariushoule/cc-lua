-- MD5:dcf89eb2d18ddfea0ca68ceef1fbddb7
fs.makeDir("/cc.servebeer.com/")
shell.setDir("/cc.servebeer.com/")

shell.run("wget", "http://cc.servebeer.com/startup", "/startup")
shell.run("wget", "http://cc.servebeer.com/scripts/api/json.lua", "/cc.servebeer.com/api/json.lua")

os.loadAPI("/cc.servebeer.com/api/json")

local metaHttp = http.get("http://cc.servebeer.com/meta/")
json.parse(metaHttp.readAll())
metaHttp.close()

for _, script in ipairs(scripts) do
  shell.run("wget", "http://cc.servebeer.com/scripts/" .. script)
end

shell.run("/startup")