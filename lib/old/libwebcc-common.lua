-- WebCC Library (libwebcc)
-- common code between parts

local LibWebCC = {}

--- String startswith function I stole from stackoverflow
--- https://stackoverflow.com/questions/22831701/lua-read-beginning-of-a-string
--- @param String string String to read
--- @param Start string String to match
function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end

--- Send payload from IP Address
--- @param Address string Destination IP address
--- @param Type string Type of the request
--- @param Payload string Payload to send
function LibWebCC.sendFromIP(Protocol, Address, Type, Payload)
	if Type == "GET" then
		-- print(Protocol .. Address)
		local svID = rednet.lookup(Protocol, Address)
		rednet.send(svID, Type, Protocol)
	end
end

--- Send payload from Domain name
--- @param Protocol string Your protocol of choice
--- @param DNSAddress string IP address of the DNS server
--- @param Domain string Destination Domain name
--- @param Type string Type of the request
--- @param Payload string Payload to send
function LibWebCC.sendFromDomain(Protocol, DNSAddress, Domain, Type, Payload)
	local dnsID = parallel.waitForAll(rednet.lookup(Protocol, DNSAddress))
	rednet.send(dnsID, "RESOLVE#" .. Domain, Protocol)

	local id, msg = parallel.waitForAll(rednet.receive(Protocol))

	LibWebCC.sendFromIP(Protocol, msg, Type, Payload)
end

return LibWebCC
