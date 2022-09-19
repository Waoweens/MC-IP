-- Simple CLI CC-IP requester

require("/lib/cc-ip/libccip")

local client = CCIPClient;
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

local function listen()
	
end

-- parallel.waitForAny(main(), listen())
-- function client()
-- 	-- ask user
-- 	print("DNS Server is " .. dnsIP)
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
