local sti = require "sti"

function love.load()
	map = sti("test_room.lua")
end

function love.update(dt)
	map:update(dt)
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	map:draw(0,0,3,3) -- tx, ty, sx, sy
end