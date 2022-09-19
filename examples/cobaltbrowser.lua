-- CC-IP Browser made with Cobalt UI
-- Cobalt must be installed for this to work
-- https://github.com/ebernerd/Cobalt

local cobalt = dofile('cobalt')
cobalt.ui = dofile('cobalt-ui/init.lua')

local panelToolbar = cobalt.ui.new({w="100%", h=2,})
local txtTitle = panelToolbar:add("text", { text="Cobalt Browser", wrap="center", y=1, backColour=colors.})
local btnBack = panelToolbar:add("button", {text="<", x=2, y=2, w=0, h=1, backColour=colors.black, foreColour=colors.lightGray})
local btnRefresh = panelToolbar:add("button", {text='R', x=4, y=2, w=0, h=1, backColour=colors.black, foreColour=colors.lightGray})
local btnForward = panelToolbar:add("button", {text=">", x=6, y=2, w=0, h=1, backColour=colors.black, foreColour=colors.lightGray})

-- Cobalt boilerplate

function cobalt.update(dt)
	cobalt.ui.update(dt)
end

function cobalt.draw()
	cobalt.ui.draw()
end

function cobalt.mousepressed(x, y, button)
	cobalt.ui.mousepressed(x, y, button)
end

function cobalt.mousereleased(x, y, button)
	cobalt.ui.mousereleased(x, y, button)
end

function cobalt.keypressed(keycode, key)
	cobalt.ui.keypressed(keycode, key)
end

function cobalt.keyreleased(keycode, key)
	cobalt.ui.keyreleased(keycode, key)
end

function cobalt.textinput(t)
	cobalt.ui.textinput(t)
end

cobalt.initLoop()