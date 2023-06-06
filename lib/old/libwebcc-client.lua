-- WebCC Library (libwebcc)
-- Client implementation

-- relative paths are broken so we have to do this mess
-- code stolen from https://github.com/Pyroxenium/Basalt/blob/master/Basalt/init.lua
local curDir = fs.getDir(table.pack(...)[2]) or ""
local defaultPath = package.path
local format = "%s;/%s/?.lua;/%s/?/init.lua"
package.path = string.format(format, package.path, curDir,curDir)

local lc = require("libwebcc-common")
package.path = defaultPath

local WebCCClient = {}

--- Initialize WebCC client
--- @param PeripheralID string Side or ID of the modem
--- @param Protocol string Your protocol of choice
--- @param DNSAddress string IP Address of the DNS server
function WebCCClient:init(PeripheralID, Protocol, DNSAddress)
	rednet.open(PeripheralID)
	self.proto = Protocol
	self.dnsAddr = DNSAddress
	return true
end

--- Send a request
--- @param Address string IP address or domain name of the destination
--- @param Type string Type of the request
--- @param Payload? string Payload to send
function WebCCClient:request(Address, Type, Payload)
	if string.starts(Address, "300") then
		lc.sendFromIP(self.proto, Address, Type, Payload or "")
	else
		lc.sendFromDomain(self.proto, self.dnsAddr, Address, Type, Payload or "")
	end
end

--- Listen for requests
function WebCCClient:listen()
	return rednet.receive(self.proto)
end

return WebCCClient
