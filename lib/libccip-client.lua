-- CC-IP Library (libccip)
-- Client implementation

os.loadAPI("libccip-common.lua")

rednet.open("top")
proto = "MC-IP"
dnsIP = "300.400.050.001"

function sendFromIP(Input, Type)
	if Type == "GET" then
		svID = rednet.lookup(proto, Input)
		rednet.send(svID, Type, proto)
	end
end

function sendFromDomain(Input, Type)
	dnsID = rednet.lookup(proto, dnsIP)
	rednet.send(dnsID, "RESOLVE#" .. Input, proto)

	id, msg = rednet.receive(proto)
	print(Input .. " resolved to " .. msg)

	sendFromIP(msg, Type)
end

function client()
	-- ask user
	print("DNS Server is " .. dnsIP)
	write("Enter URL: http://")
	input = read()

	-- determine if IP or domain
	-- all CC-IP addresses start with 300
	if string.starts(input, "300") then
		sendFromIP(input, "GET")
	else
		sendFromDomain(input, "GET")
	end

	id, msg = rednet.receive(proto)
	print(msg)

	client()
end

client()