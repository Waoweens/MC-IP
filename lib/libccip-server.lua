-- CC-IP Library (libccip)
-- Server implementation
dofile("/lib/cc-ip/libccip-common.lua")

CCIPServer = {}
CCIPClient.Proto = nil
CCIPClient.DNSAddr = nil

--- Initialize CCIP server
-- @param PeripheralID[String] Side or ID of the modem
-- @param Protocol[String] Your protocol of choice
-- @param IP Address[String] of the DNS server
function CCIPServer:init(PeripheralID, Protocol, DNSAddress)
	rednet.open(PeripheralID)
	CCIPClient.Proto = Protocol
	CCIPClient.DNSAddr = DNSAddress
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
