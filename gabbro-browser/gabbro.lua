--Basalt configurated installer
local filePath = "/basalt" -- you need to change both this and the require() line
if not(fs.exists(filePath..".lua"))then
    shell.run("pastebin run ESs1mg7P packed true "..filePath)
end
local basalt = require("/basalt") -- stupid vscode lua extension wont accept variable paths

basalt.setVariable("exit", function()
    basalt.stopUpdate()
    print("Gabbro Browser")
end)

local container = basalt.createFrame():addLayout(fs.getDir(shell.getRunningProgram()).."/ui/main.xml")


local barTab = container:getDeepObject("barTab")
	:addItem("New Tab")
	:addItem("+")

local pageContent = container:getDeepObject("pageContent")
for i = 1,1001 do
    pageContent:addLabel():setText("Hello World #"..i):setPosition(1,i)
end
local pageWidth, pageHeight = pageContent:getSize()

local mainScroll = container:getDeepObject("mainScroll")
	:setMaxValue(1000)
	:onChange(function(self)
		local v = self:getValue()
		pageContent:setOffset(0,v-1)
	end)

basalt.autoUpdate()