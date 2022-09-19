-- CC-IP Library (libccip)
-- Client implementation

require("/lib/cc-ip/libccip-common")
local lc = LibCCIP

CCIPClient = {}
CCIPClient.Proto = nil
CCIPClient.DNSAddr = nil

--- Initialize CCIP client
-- @param PeripheralID[String] Side or ID of the modem
-- @param Protocol[String] Your protocol of choice
-- @param IP Address[String] of the DNS server
function CCIPClient:init(PeripheralID, Protocol, DNSAddress)
	rednet.open(PeripheralID)
	CCIPClient.Proto = Protocol
	CCIPClient.DNSAddr = DNSAddress
end

--- Send a request
-- @param Address[String] IP address or domain name of the destination
-- @param Type[String] Type of the request
-- @param Payload[String] Payload to send
function CCIPClient:request(Address, Type, Payload)
	if string.starts(Address, "300") then
		lc:sendFromIP(Address, Type, Payload or "")
	else
		lc:sendFromDomain(Address, Type, Payload or "")
	end
end

--- Listen for requests
-- @param Protocol[String] Your protocol of choice
-- @param Blocking[Bool] Whether the listen should block the code or not
function CCIPClient:listen(Protocol, Blocking)
	if Blocking == false or nil then
		parallel.waitForAll(rednet.listen(Protocol))
	else
		rednet.listen(Protocol)
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
