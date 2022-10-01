-- CC-IP Library (libccip)
-- Client implementation

local lc = LibCCIP

CCIPClient = {}
CCIPClient.Proto = nil
CCIPClient.DNSAddr = nil

--- Initialize CCIP client
--- @param PeripheralID string Side or ID of the modem
--- @param Protocol string Your protocol of choice
--- @param DNSAddress string IP Address of the DNS server
function CCIPClient:init(PeripheralID, Protocol, DNSAddress)
	rednet.open(PeripheralID)
	CCIPClient.Proto = Protocol
	CCIPClient.DNSAddr = DNSAddress
end

--- Send a request
--- @param Address string IP address or domain name of the destination
--- @param Type string Type of the request
--- @param Payload? string Payload to send
function CCIPClient:request(Address, Type, Payload)
	if string.starts(Address, "300") then
		lc:sendFromIP(CCIPClient.Proto, Address, Type, Payload or "")
	else
		lc:sendFromDomain(CCIPClient.Proto, CCIPClient.DNSAddr, Address, Type, Payload or "")
	end
end

--- Listen for requests
function CCIPClient:listen()
	return rednet.receive(CCIPClient.Proto)
end
