local sti = require "sti"
local bump = require "bump"
require "camera"
require "entity"

function love.load()
	TILESIZE = 16
	map = sti("test_room.lua")
	
	worldTick = 0
	gravity = 2
	

	
	playerX = 32
	playerY = 32
	playerSpeed = 1

	playerTileX = 0
	playerTileY = 0
	
	player_idle_frames = {}
	playerAnimFrame = 1
	for i = 1, 4 do
		player_idle_frames[i] = love.graphics.newImage("sprite/player_idle" .. i .. ".png")
	end

	
	player = {
		x = 32,
		y = 32,
		speed = 1,
		tileX = 0,
		tileY = 0,
		
		animFrames = {}
	}
	
	cam_zoom = 3
end

function collide(x, y)
	layer = map.layers[0]
	return false
end

function love.update(dt)
	
	worldTick = worldTick + 1
	map:update(dt) -- update map and everything and yeah

	cam_x = playerX -- update camera
	cam_y = playerY
	
	playerY = playerY + gravity
	
	if love.keyboard.isDown("left") then -- update player pos
		playerX = playerX - (playerSpeed)
	end
    if love.keyboard.isDown("right") then
		playerX = playerX + (playerSpeed)
    end
    if love.keyboard.isDown("z") then
	
    end
	
	playerTileX = math.floor(playerX / TILESIZE) -- update tile pos
	playerTileY = math.floor(playerY / TILESIZE)
	
	if collide(playerTileX, playerTileY) then
		print("e")
	end
   
    if (worldTick % 8 == 0) then
		playerAnimFrame = playerAnimFrame + 1
		if playerAnimFrame > 4 then
			playerAnimFrame = 1
		end
	end
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	
	mapRenderX = (love.graphics.getWidth() / 2 / cam_zoom) - playerX
	mapRenderY = (love.graphics.getHeight() / 2 / cam_zoom) - playerY
	map:draw(mapRenderX,mapRenderY,cam_zoom,cam_zoom) -- tx, ty, sx, sy
	
	love.graphics.draw(player_idle_frames[playerAnimFrame], tra_x(playerX), tra_y(playerY), 0 , cam_zoom, cam_zoom)
	
	love.graphics.print(playerTileX, 0, 0)
	love.graphics.print(playerTileY, 0, 10)
end