local sti = require "sti"
local bump = require "bump"
require "camera"
require "entity"
require "util"

function love.load()

	paused = false
	textMode = false
	currentText = ""

	TILESIZE = 16
	
	world = bump.newWorld(16)

	rooms = require( "rooms" )
	room_data_paths = {
	"room/test_room",
	"room/heaven",
	"room/town" }
	
	worldTick = 0
	gravity = 0.8
	
	playerSpeed = 1.5

	playerTileX = 0
	playerTileY = 0
	
	player_idle_frames = {}
	playerAnimFrame = 1
	for i = 1, 4 do
		player_idle_frames[i] = love.graphics.newImage("sprite/player_idle" .. i .. ".png")
	end

	cam_zoom = 3
	
	init_room(3)
end

function init_room(id)

	if room_music ~= nil then
		room_music.stop(room_music)
	end

	map = sti(room_data_paths[id] .. ".lua")
	room = rooms[id]
	room_data = require(room_data_paths[id])
	
	if (room.music ~= nil) and (room.music ~= "") then
		room_music = love.audio.newSource(room.music, "stream")
		room_music.setLooping(room_music, true)
		room_music.play(room_music)
	end

	tileHitboxes = {}
	
	world = bump.newWorld(16)
	layer = room_data.layers[1]
	data = layer.data
	
	for i = 1, layer.width*layer.height do -- Adding hitboxes for each colliding tile (<512) in the tileset
		
		if data[i] < 512 and data[i] ~= 0 then
			
			xpos = TILESIZE * ((i-1) % layer.width)
			ypos = TILESIZE * math.floor((i-1) / layer.width)
			
			tileHitboxes[i] = {x=xpos,y=ypos,w=TILESIZE,h=TILESIZE}
			world:add(tileHitboxes[i], xpos, ypos, TILESIZE, TILESIZE)
		end
	end
	world:add(player.boundingBox, player.boundingBox.x, player.boundingBox.y, player.boundingBox.w, player.boundingBox.h) -- player hitbox
end

function love.update(dt)
	
	worldTick = worldTick + 1
	map:update(dt) -- update map and everything and yeah
	
	cam_x = player.x -- update camera
	cam_y = player.y
	
	if love.keyboard.isDown("x") and player.grounded then
		player.maxVel = 3
	else
		player.maxVel = 1
	end
	
	if love.keyboard.isDown("left") then -- update player vel
		if (player.xvel > -player.maxVel) then
		
			if (player.xvel > 0) then
				player.xvel = 0
			end
			
			if player.grounded then
				player.xvel = player.xvel - 0.3
			else
				player.xvel = player.xvel - 0.1
			end
		end
		
    elseif love.keyboard.isDown("right") then
		if (player.xvel < player.maxVel) then
		
			if (player.xvel < 0) then
				player.xvel = 0
			end
			
			if player.grounded then
				player.xvel = player.xvel + 0.3
			else
				player.xvel = player.xvel + 0.1
			end
		end
	else
		player.xvel = player.xvel / 1.01
    end
	
	if love.keyboard.isDown("z") and player.grounded then
	
		for i, e in ipairs(room.entities) do
			if CheckCollision(player.x,player.y,player.width,player.height, e.x, e.y, e.width, e.height) then
				if (e.dialog ~= nil) then
					textMode = true
				end
			end
		end
		
		if not textMode then
			player.yvel = player.yvel - 6 -- jumping
		end
	else
		player.yvel = ((player.yvel - gravity) / 1.1) + gravity
    end
	
	if love.keyboard.isDown("down") then 
	end
	
	-- player.x = player.x + player.xvel
	-- player.y = player.y + player.yvel
	player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, player.x + player.xvel, player.y + player.yvel)
	
	if math.abs(player.yvel) > gravity * (0.5) and lenth > 0 then
		player.grounded = true
		player.yvel = 0
	else
		player.grounded = false
	end
	
	player.x = player.boundingBox.x
	player.y = player.boundingBox.y
	
	if love.keyboard.isDown("up") then 

		for i, e in ipairs(room.entities) do
			if CheckCollision(player.x,player.y,player.width,player.height, e.x, e.y, e.width, e.height) then
				if (e.roomDestination ~= nil) and player.doorTimer > 30 then

					player.boundingBox.x = e.destX -- player bounding box has to be initialized before
					player.boundingBox.y = e.destY
					
					init_room(e.roomDestination)
					
					player.x = e.destX
					player.y = e.destY
					player.doorTimer = 0
					break
				end
			end
		end

	end
	
	playerTileX = math.floor(player.x / TILESIZE) -- update tile pos
	playerTileY = math.floor(player.y / TILESIZE)
	playerTileX2 = math.ceil(player.x / TILESIZE) -- update tile pos
	playerTileY2 = math.ceil(player.y / TILESIZE)
	
    if (worldTick % 8 == 0) then
		playerAnimFrame = playerAnimFrame + 1
		if playerAnimFrame > 4 then
			playerAnimFrame = 1
		end
	end
	player.doorTimer = player.doorTimer + 1
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	
	mapRenderX = (love.graphics.getWidth() / 2 / cam_zoom) - player.x
	mapRenderY = (love.graphics.getHeight() / 2 / cam_zoom) - player.y
	map:draw(mapRenderX,mapRenderY,cam_zoom,cam_zoom) -- tx, ty, sx, sy
	
	for i, e in ipairs(room.entities) do
		love.graphics.draw(player_idle_frames[1], tra_x(e.x), tra_y(e.y), 0, cam_zoom, cam_zoom)
	end
	
	love.graphics.draw(player_idle_frames[playerAnimFrame], tra_x(player.x), tra_y(player.y), 0 , cam_zoom, cam_zoom)
	
	for i = 1, room_data.layers[1].width * room_data.layers[1].height do
		
		local b = tileHitboxes[i]
		if b ~= nil then
			love.graphics.setColor(1,0,0)
			love.graphics.rectangle("line", tra_x(b.x), tra_y(b.y), b.w * cam_zoom, b.h * cam_zoom)
		end
		b = player.boundingBox
		love.graphics.setColor(0,1,0)
		love.graphics.rectangle("line", tra_x(b.x), tra_y(b.y), b.w * cam_zoom, b.h * cam_zoom)
		
	end
	
	love.graphics.print(player.x, 0, 0)
	love.graphics.print(player.y, 0, 10)
	
	if textMode then
		
		
	
	end
end