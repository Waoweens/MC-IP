-- CC-IP Library (libccip)
-- Client implementation

dofile("/lib/cc-ip/libccip-common.lua")
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
		lc:sendFromIP(CCIPClient.Proto, Address, Type, Payload or "")
	else
		lc:sendFromDomain(CCIPClient.Proto, Address, Type, Payload or "")
	end
end

--- Listen for requests
function CCIPClient:listen()
	return rednet.receive(CCIPClient.Proto)
end
