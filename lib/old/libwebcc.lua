-- relative paths are broken so we have to do this mess
-- code stolen from https://github.com/Pyroxenium/Basalt/blob/master/Basalt/init.lua
local curDir = fs.getDir(table.pack(...)[2]) or ""
local defaultPath = package.path
local format = "%s;/%s/?.lua;/%s/?/init.lua"
package.path = string.format(format, package.path, curDir,curDir)

local lcn = requite("libwebcc-common")
local lct = require("libwebcc-client")
local lsr = require("libwebcc-server")
local lds = require("libwebcc-dns")

package.path = defaultPath

return lcn, lct, lsr, lds
