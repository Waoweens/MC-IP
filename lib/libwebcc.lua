-- Computercraft Web (WebCC)
-- Single file edition
-- https://github.com/Waoweens/WebCC

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
		local svID = rednet.lookup(Protocol, Address)
		rednet.send(svID, Type, Protocol)
	end
	if Type == "POST" then
		if Payload == nil then
			error("No payload specified")
		else
			local svID = rednet.lookup(Protocol, Address)
			rednet.send(svID, Type .. string.char(6) .. Payload, Protocol)
		end
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
	rednet.send(dnsID, "RESOLVE".. string.char(6) .. Domain, Protocol)

	local id, msg = parallel.waitForAll(rednet.receive(Protocol))

	LibWebCC.sendFromIP(Protocol, msg, Type, Payload)
end

--- Initialize WebCC
--- @param PeripheralID string Side or ID of the modem
--- @param Protocol string Your protocol of choice
--- @param IPAddress string IP Address of the computer
--- @param Port? number Port of your application (Default 80)
--- @param DNS? string IP Address of the DNS server
function LibWebCC:init(PeripheralID, Protocol, IPAddress, Port, DNS)
	rednet.open(PeripheralID)
	rednet.host(Protocol, IPAddress)
	self.proto = Protocol .. ":" .. (Port or 80)
	self.ipaddr = IPAddress
end

--- Send a request
--- @param Address string IP address or domain name of the destination
--- @param Type string Type of the request
--- @param Payload? string Payload to send
function LibWebCC:request(Address, Type, Payload)
	if string.starts(Address, "300") then
		LibWebCC.sendFromIP(self.proto, Address, Type, Payload or "")
	else
		LibWebCC.sendFromDomain(self.proto, self.dnsAddr, Address, Type, Payload or "")
	end
end

--- Listen for requests
--- @param Timeout? number Timeout in seconds
--- @return number senderID ID of the sender computer
--- @return any message Message content
--- @return string protocol Protocol of the sender computer
function LibWebCC:listen(Timeout)
	return rednet.receive(self.proto, Timeout or nil)
end

return LibWebCC
