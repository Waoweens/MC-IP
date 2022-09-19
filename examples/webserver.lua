-- CC-IP Library (libccip)
-- Server implementation
require("/lib/cc-ip/libccip")
page = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Test</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
]]

rednet.open("top")
proto = "RNP/IP"
ip = "300.420.100.15"
rednet.host(proto, ip)
function server()
	id, msg = rednet.receive(proto)
	print("Received " .. msg .. " from " .. id)

	if msg == "GET" then
		print("Sending to " .. id)
		rednet.send(id, page, proto)
	end

	server()
end

server()
