-- CC-IP Library (libccip)
-- DNS implementation

-- relative paths are broken so we have to do this mess
-- code stolen from https://github.com/Pyroxenium/Basalt/blob/master/Basalt/init.lua
local curDir = fs.getDir(table.pack(...)[2]) or ""
local defaultPath = package.path
local format = "%s;/%s/?.lua;/%s/?/init.lua"
package.path = string.format(format, package.path, curDir,curDir)

local lc = require("libccip-common")
package.path = defaultPath

rednet.open("top")
proto = "MC-IP"
ip = "300.400.050.001"
rednet.host(proto, ip)

function resolve()
	id, msg = rednet.receive(proto)
	print("Received " .. msg .. " from " .. id)

	if string.starts(msg, "RESOLVE#") then
		d, domain = msg:match("^(.+)%^(.+)$")
		print(domain)
		rednet.send(id, servers[domain], proto)
	end

	resolve()
end

resolve()
