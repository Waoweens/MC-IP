-- Simple CLI CC-IP requester

require("/lib/cc-ip/libccip.h")

local client = CCIPClient;

client:init("top", "RNP/IP", "300.400.50.1")

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
