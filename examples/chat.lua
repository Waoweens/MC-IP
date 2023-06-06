-- Simple chat app
local net = require("/lib/webcc/libwebcc")
local cfg = require("/network.lua")

local proto = "RNP/IP"
local port = 1669

net:init(cfg.modem.id, proto, cfg.modem.ipv4, port)

local function send()
	write("Recipient: 300.")
	local input = "300." .. read()

	net:request(input, "POST", read())

	send()
end

local function receive()
	local id, msg = net:listen()
	print(id..msg)
	receive()
end

parallel.waitForAll(send, receive)