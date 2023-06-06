-- WebCC Library (libwebcc)
-- Server implementation

local server = require("/lib/webcc/libwebcc")
local modem = "top"
local proto = "RNP/IP"
local dnsIP = "300.400.50.1"
local file = fs.getDir(shell.getRunningProgram()) .. "/index.html"
local html = ""

local hFile = fs.open(file, "r")
if hFile then html = hFile.readAll() end

server:init(modem, proto, dnsIP)



-- rednet.open("top")
-- proto = "RNP/IP"
-- ip = "300.420.100.15"
-- rednet.host(proto, ip)
-- function server()
-- 	id, msg = rednet.receive(proto)
-- 	print("Received " .. msg .. " from " .. id)

-- 	if msg == "GET" then
-- 		print("Sending to " .. id)
-- 		rednet.send(id, page, proto)
-- 	end

-- 	server()
-- end

-- server()
