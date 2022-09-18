-- CC-IP Library (libccip)
-- common code between parts

LibCCIP = {}
LibCCIP.Proto = nil
LibCCIP.DNSAddr = nil

function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end

function LibCCIP.sendFromIP(Address, Type, Payload)
	if Type == "GET" then
		local svID = rednet.lookup(LibCCIP.Proto, Address)
		rednet.send(svID, Type, LibCCIP.Proto)
	end
end

function LibCCIP.sendFromDomain(Address, Type, Payload)
	local dnsID = rednet.lookup(LibCCIP.Proto, LibCCIP.DNSAddr)
	rednet.send(dnsID, "RESOLVE#" .. Address, LibCCIP.Proto)

	local id, msg = rednet.receive(LibCCIP.Proto)

	LibCCIP.sendFromIP(msg, Type, Payload)
end
