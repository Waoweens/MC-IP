--Basalt configurated installer
local filePath = "/basalt.lua" --here you can change the file path default: basalt
if not(fs.exists(filePath))then
    shell.run("pastebin run ESs1mg7P packed true "..filePath:gsub(".lua", "")) -- this is an alternative to the wget command
end
local basalt = require(filePath:gsub(".lua", ""))

local main = basalt.createFrame():addLayout(fs.getDir(shell.getRunningProgram()).."/main.xml") -- and atleast 1 base frame is needed

basalt.autoUpdate() -- starting the event and draw handler is also needed