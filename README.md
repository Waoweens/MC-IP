# CC-IP

""Internet"" system for ComputerCraft (ab)using the Rednet API

## Installation
### Automatic installer (WIP)
Coming soon

### Manual
> Note: Due to a problem with relative paths, the library must be installed in `/lib/cc-ip` unless you modify the files.

Copy the contents of the `📁lib/` folder into `/lib/cc-ip` in ComputerCraft.

<!-- Copy the contents of the `📁defaultconfigs/` folder into `/etc/cc-ip` in ComputerCraft. -->

## Usage (WIP)
Some examples are available in the `📁examples/` folder.

### Client
```lua
require("/lib/cc-ip/libccip")
local client = CCIPClient
local modem = "top"
local proto = "RNP/IP"
local dnsIP = "300.400.50.1"

client:init(modem, proto, dnsIP)

local function main()
	client:request("www.test.com", "GET")
	local id, msg = client:listen()
	print(msg)

	client:request("300.129.40.104", "GET")
	local id, msg = client:listen()
	print(msg)

	main()
end
main()
```

### Server
```lua
require("/lib/cc-ip/libccip")
```

### DNS Server
```lua
require("/lib/cc-ip/libccip")
```
