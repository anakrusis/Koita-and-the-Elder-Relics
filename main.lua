local sti = require "sti"
local bump = require "bump"
require "camera"
require "entity"

function round(x)
	if x%2 ~= 0.5 then
		return math.floor(x+0.5)
	end
	return x-0.5
end

function love.load()
	TILESIZE = 16
	
	world = bump.newWorld(16)
	map = sti("test_room.lua")
	test_room = require("test_room")
	
	worldTick = 0
	gravity = 0.8
	
	playerX = 32
	playerY = 32
	playerSpeed = 1.5

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
		width = 16,
		height = 32,
		speed = 1,
		tileX = 0,
		tileY = 0,
		boundingBox = {x=32,y=32,w=15,h=32},
		
		animFrames = {},
		grounded = false
	}
	cam_zoom = 3
	
	init_room(test_room)
end

function init_room(room)
	tileHitboxes = {}
	entityHitboxes = {}
	
	world = bump.newWorld(16)
	layer = room.layers[1]
	data = layer.data
	
	for i = 1, layer.width*layer.height do
		
		if data[i] < 512 and data[i] ~= 0 then
			
			xpos = TILESIZE * ((i-1) % layer.width)
			ypos = TILESIZE * math.floor((i-1) / layer.width)
			
			tileHitboxes[i] = {x=xpos,y=ypos,w=TILESIZE,h=TILESIZE}
			print(xpos .. "," .. ypos)
			world:add(tileHitboxes[i], xpos, ypos, TILESIZE, TILESIZE)
		end
	end
	world:add(player.boundingBox, player.boundingBox.x, player.boundingBox.y, player.boundingBox.w, player.boundingBox.h)
end

function love.update(dt)
	
	worldTick = worldTick + 1
	map:update(dt) -- update map and everything and yeah
	
	cam_x = playerX -- update camera
	cam_y = playerY
	
	if love.keyboard.isDown("left") then -- update player pos
		player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, playerX - playerSpeed, playerY)
	end
    if love.keyboard.isDown("right") then
		player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, playerX + playerSpeed, playerY)
    end
	if love.keyboard.isDown("down") then 

	end
	if love.keyboard.isDown("up") then 
	
	end
	
	playerX = player.boundingBox.x
	
	player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, playerX, playerY + gravity)
	
	if love.keyboard.isDown("z") then
		player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, playerX, playerY - playerSpeed)
    end
	
	playerY = player.boundingBox.y
	
	playerTileX = math.floor(playerX / TILESIZE) -- update tile pos
	playerTileY = math.floor(playerY / TILESIZE)
	playerTileX2 = math.ceil(playerX / TILESIZE) -- update tile pos
	playerTileY2 = math.ceil(playerY / TILESIZE)
	
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

	for i = 1, test_room.layers[1].width * test_room.layers[1].height do
		
		local b = tileHitboxes[i]
		if b ~= nil then
			love.graphics.setColor(1,0,0)
			love.graphics.rectangle("line", tra_x(b.x), tra_y(b.y), b.w * cam_zoom, b.h * cam_zoom)
		end
		b = player.boundingBox
		love.graphics.setColor(0,1,0)
		love.graphics.rectangle("line", tra_x(b.x), tra_y(b.y), b.w * cam_zoom, b.h * cam_zoom)
		
	end
	
	love.graphics.print(playerTileX, 0, 0)
	love.graphics.print(playerTileY, 0, 10)
end