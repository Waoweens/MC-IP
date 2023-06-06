# WebCC
> Formerly CC-IP

""Internet"" system for ComputerCraft (ab)using the Rednet API

## Installation
### Automatic installer (WIP)
Coming soon

### Manual
> Note: Due to a problem with relative paths, the library must be installed in `/lib/webcc` unless you modify the files.

Copy the contents of the `📁lib/` folder into `/lib/webcc` in ComputerCraft.

<!-- Copy the contents of the `📁defaultconfigs/` folder into `/etc/webcc` in ComputerCraft. -->

## Gabbro Browser
[Gabbro Browser](https://github.com/Waoweens/WebCC/tree/main/gabbro-browser) is a web browser for WebCC made with the [Basalt UI framework](https://basalt.madefor.cc/).

<!--A submodule is provided for easier development.-->

## Usage (WIP)
Some examples are available in the `📁examples/` folder.

### Client
```lua
require("/lib/webcc/libwebcc")
local client = WebCCClient
local modem = "modem_2" -- can be side (like "top") or ID (like "modem_15") 
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
require("/lib/webcc/libwebcc")
```

### DNS Server
```lua
require("/lib/webcc/libwebcc")
```

## License
## License
WebCC

Copyright (C) 2023  Meowcorp Group

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
