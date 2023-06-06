-- relative paths are broken so we have to do this mess
-- code stolen from https://github.com/Pyroxenium/Basalt/blob/master/Basalt/init.lua
local curDir = fs.getDir(table.pack(...)[2]) or ""
local defaultPath = package.path
local format = "%s;/%s/?.lua;/%s/?/init.lua"
package.path = string.format(format, package.path, curDir,curDir)

local lcn = requite("libccip-common")
local lct = require("libccip-client")
local lsr = require("libccip-server")
local lds = require("libccip-dns")

package.path = defaultPath

return lcn, lct, lsr, lds
