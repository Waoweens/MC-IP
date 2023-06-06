-- CC-IP Library (libccip)
-- Server implementation

-- relative paths are broken so we have to do this mess
-- code stolen from https://github.com/Pyroxenium/Basalt/blob/master/Basalt/init.lua
local curDir = fs.getDir(table.pack(...)[2]) or ""
local defaultPath = package.path
local format = "%s;/%s/?.lua;/%s/?/init.lua"
package.path = string.format(format, package.path, curDir,curDir)
local lc = require("libccip-common")
package.path = defaultPath

lc.Proto = nil
lc.IPAddr = nil

--- Initialize CCIP server
--- @param PeripheralID string Side or ID of the modem
--- @param Protocol string Your protocol of choice
--- @param IPAddress string IP Address of the DNS server
--- @param PagesLocation string Location of the HTML pages
function CCIPServer:init(PeripheralID, Protocol, IPAddress, PagesLocation)
	rednet.open(PeripheralID)
	rednet.host(Protocol, IPAddress)
	CCIPServer.Proto = Protocol
	CCIPServer.IPAddr = IPAddress
end

--- Send a request
--- @param Address string IP address or domain name of the destination
--- @param Type string Type of the request
--- @param Payload? string Payload to send
function CCIPServer:request(Address, Type, Payload)
	if string.starts(Address, "300") then
		lc.sendFromIP(CCIPServer.Proto, Address, Type, Payload or "")
	else
		lc.sendFromDomain(CCIPServer.Proto, CCIPServer.DNSAddr, Address, Type, Payload or "")
	end
end

--- Listen for requests
function CCIPServer:listen()
	return rednet.receive(CCIPServer.Proto)
end

-- page = [[
-- <!DOCTYPE html>
-- <html lang="en">
--     <head>
--         <title>Test</title>
--     </head>
--     <body>
--         <h1>Hello World!</h1>
--     </body>
-- </html>
-- ]]

-- rednet.open("top")
-- proto = "MC-IP"
-- ip = "300.420.100.015"
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
