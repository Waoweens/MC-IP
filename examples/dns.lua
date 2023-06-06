rednet.open("top")
proto = "MC-IP"
ip = "300.400.050.001"
rednet.host(proto, ip)

function resolve()
	id, msg = rednet.receive(proto)
	print("Received " .. msg .. " from " .. id)

	if string.starts(msg, "RESOLVE#") then
		d, domain = msg:match("^(.+)[%x6](.+)$")
		print(domain)
		rednet.send(id, servers[domain], proto)
	end

	resolve()
end

resolve()