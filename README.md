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

### Configuration
Server HTML Pages are located at `/etc/cc-ip/pages`

<!-- | Name | Location |
| ---- | -------- |
| Client Configuration | `/etc/cc-ip/config-client.lua` |
| Server Configuration | `/etc/cc-ip/config-server.lua` |
| DNS Server Configuration | `/etc/cc-ip/config-dns.llua.lua` |
| Server HTML Pages | `/etc/cc-ip/server/pages/` |
| DNS Lookup Table | `/etc/cc-ip/dns/lookuptable.lua` | -->

### Client
```lua
os.loadAPI("/lib/cc-ip/libccip.lua")
```

### Server
```lua
os.loadAPI("/lib/cc-ip/libccip.lua")
```

### DNS Server
```lua
os.loadAPI("/lib/cc-ip/libccip.lua")
```
