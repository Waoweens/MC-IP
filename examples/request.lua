-- Simple CLI CC-IP requester

local client = require("/lib/cc-ip/libccip");
local modem = "top"
local proto = "RNP/IP"
local dnsIP = "300.400.50.1"

client:init(modem, proto, dnsIP)

local function main()
	print("DNS server is " .. dnsIP)
	write("Enter URL: rntp://")
	local input = read()

	client:request(input, "GET")
	local id, msg = client:listen()
	print(msg)

	main()
end
main()
