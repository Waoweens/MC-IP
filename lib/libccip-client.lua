-- CC-IP Library (libccip)
-- Client implementation

require("libccip-common")

CCIPClient = {}

--- Initialize CCIP client
-- @param PeripheralID Side or ID of the modem
-- @param Protocol Your protocol of choice
-- @param IP Address of the DNS server
function CCIPClient:init(PeripheralID, Protocol, DNSAddress)
	rednet.open(PeripheralID)
	LibCCIP.Proto = Protocol
	LibCCIP.DNSAddr = DNSAddress
end

--- Send a request
-- @param Address IP address or domain name of the destination
-- @param Type Type of the request
-- @param Payload Payload to send
function CCIPClient:request(Address, Type, Payload)
	if string.starts(Address, "300") then
		LibCCIP.sendFromIP(Address, Type, Payload or "")
	else
		LibCCIP.sendFromDomain(Address, Type, Payload or "")
	end
end

-- function client()
-- 	-- ask user
-- 	print("DNS Server is " .. dnsIPP)
-- 	write("Enter URL: http://")
-- 	input = read()

-- 	-- determine if IP or domain
-- 	-- all CC-IP addresses start with 300
-- 	if string.starts(input, "300") then
-- 		libccip.sendFromIP(input, "GET")
-- 	else
-- 		libccip.sendFromDomain(input, "GET")
-- 	end

-- 	id, msg = rednet.receive(proto)
-- 	print(msg)

-- 	client()
-- end

-- client()
