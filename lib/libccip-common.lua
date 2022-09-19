-- CC-IP Library (libccip)
-- common code between parts

LibCCIP = {}

--- String starts with function I stole from stackoverflow
-- https://stackoverflow.com/questions/22831701/lua-read-beginning-of-a-string
-- @param String[String] String to read
-- @param Start[String] String to match
function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end


--- Send payload from IP Address
-- @param Address[String] Destination IP address
-- @param Type[String] Type of the request
-- @param Payload[String] Payload to send
function LibCCIP:sendFromIP(Protocol, Address, Type, Payload)
	if Type == "GET" then
		local svID = rednet.lookup(Protocol, Address)
		rednet.send(svID, Type, Protocol)
	end
end

--- Send payload from Domain name
-- @param Protocol[String] Your protocol of choice
-- @param DNSAddress[String] IP address of the DNS server
-- @param Domain[String] Destination Domain name
-- @param Type[String] Type of the request
-- @param Payload[String] Payload to send
function LibCCIP:sendFromDomain(Protocol, DNSAddress, Domain, Type, Payload)
	local dnsID = parallel.waitForAll(rednet.lookup(Protocol, DNSAddress))
	rednet.send(dnsID, "RESOLVE#" .. Domain, Protocol)

	local id, msg = parallel.waitForAll(rednet.receive(Protocol))

	LibCCIP.sendFromIP(msg, Type, Payload)
end


