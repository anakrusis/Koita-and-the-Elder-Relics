local sti = require "sti"
local bump = require "bump"
require "camera"
require "entity"
require "init"
require "character"
require "render"
require "util"

function love.load()

	font = love.graphics.newFont("PressStart2P-vaV7.ttf", 24)
	love.window.setTitle("Koita and the Elder Relics")
	love.graphics.setFont(font)
	
	paused = false
	statScreen = false
	textMode = false
	dialogMenuMode = false
	menuOption = 1
	numberOfOptions = 3
	optionText = {}
	optionOffsets = {}
	
	currentText = ""
	currentTextBuffer = ""
	currentCharIndex = 1
	currentTextIndex = 1
	currentEntityTalking = nil
	stringDone = false
	convoDone = false

	TILESIZE = 16
	SFX_VOLUME = 0.6
	
	world = bump.newWorld(16)

	rooms = require( "rooms" )
	room_data_paths = {
	"room/test_room",
	"room/heaven",
	"room/town",
	"room/bar",
	"room/house",
	"room/clinic",
	"room/elevator",
	"room/cave",
	"room/cave2"}
	
	sfx_jump = love.audio.newSource("sound/jump.mp3", "static")
	sfx_jump.setVolume(sfx_jump, SFX_VOLUME)
	sfx_textblip = love.audio.newSource("sound/textblip.mp3", "static")
	sfx_textblip.setVolume(sfx_textblip, SFX_VOLUME)
	
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



function love.update(dt)
	
	worldTick = worldTick + 1
	map:update(dt) -- update map and everything and yeah
	
	cam_x = player.x -- update camera
	cam_y = player.y
	
	if not textMode and not paused then
		if love.keyboard.isDown("x") and player.grounded then -- Running, gives you a higher max velocity
			player.maxVel = 3
		else
			player.maxVel = 1
		end
		
		if love.keyboard.isDown("left") then -- update player vel
			if (player.xvel > -player.maxVel) then
			
				if (player.xvel > 0) then -- Instant turning
					player.xvel = 0
				end
				
				if player.grounded then -- Player moves slower horizontally in midair than on the ground
					player.xvel = player.xvel - 0.3
				else
					player.xvel = player.xvel - 0.1
				end
			end
			
		elseif love.keyboard.isDown("right") then -- Ditto
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
			player.xvel = player.xvel / 1.01 -- Friction/deceleration
		end
	end
	
	if love.keyboard.isDown("z") and player.grounded then	
		if not textMode then
			player.yvel = player.yvel - 6 -- Jumping
			sfx_jump.play(sfx_jump)
		end
	else
		player.yvel = ((player.yvel - gravity) / 1.1) + gravity -- Gravity pulls you down and yeah
    end
	
	if love.keyboard.isDown("down") then -- Does nothing for now
	end
	
	if not paused and not textMode then -- Updates player position based on collision, or tries to at least
		player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, player.x + player.xvel, player.y + player.yvel)	
	end
	
	if math.abs(player.yvel) > gravity * (0.5) and lenth > 0 then -- Player is grounded if colliding and yvel is close to the gravity coefficient
		player.grounded = true
		player.yvel = 0
	else
		player.grounded = false
	end
	
	player.x = player.boundingBox.x
	player.y = player.boundingBox.y
	
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
	
	if (textMode) then
		if not stringDone then
			if (string.sub(currentText, currentCharIndex, currentCharIndex) == "$") then
			
				-- last character in buffer, yes control code ($)
				stringDone = true
				
				if (string.sub(currentText, currentCharIndex+1, currentCharIndex+1) == "e") then -- Control code $e
					convoDone = true
					
					-- Hardwritten code for characters that say something different their first time versus subsequent times
					
					if currentEntityTalking.name == "Lowell" then
						currentEntityTalking.starts[1] = 2
					end
					
					if currentEntityTalking.name == "Felix" then
						currentEntityTalking.starts = {11,12,13}
					end
					
					
				elseif 	(string.sub(currentText, currentCharIndex+1, currentCharIndex+1) == "q") then -- Control code $q
				
					-- loads the question/answer type texts
				
					dialogMenuMode = true
					menuOption = 1
					numberOfOptions = tonumber(string.sub(currentText, currentCharIndex+2, currentCharIndex+2))
					for i = 1, numberOfOptions do
						offset = tonumber(string.sub(currentText, currentCharIndex+2+i, currentCharIndex+2+i))
						optionOffsets[i] = offset
						optionText[i] = currentEntityTalking.dialog[currentTextIndex + i]
					end
				end
				
			elseif currentCharIndex > string.len(currentText) then
			
				-- last character in buffer, no control code
			
				stringDone = true
			else
				
				-- add character to buffer
			
				currentTextBuffer = currentTextBuffer .. string.sub(currentText, currentCharIndex, currentCharIndex)
				currentCharIndex = currentCharIndex + 1
				sfx_textblip.play(sfx_textblip)
			end
		end
	end
end

function love.keypressed(key)

	if dialogMenuMode then
		if key == "down" then
			menuOption = math.min(menuOption+1, numberOfOptions)
			sfx_textblip.play(sfx_textblip)
		end
		if key == "up" then
			menuOption = math.max(1, menuOption-1)
			sfx_textblip.play(sfx_textblip)
		end
	end

	if key == "up" then
		if not textMode then
			for i, e in ipairs(room.entities) do
				if CheckCollision(player.x,player.y,player.width,player.height, e.x, e.y, e.width, e.height) then
					if (e.roomDestination ~= nil) then

						player.boundingBox.x = e.destX -- player bounding box has to be initialized before
						player.boundingBox.y = e.destY
						
						init_room(e.roomDestination)
						
						player.x = e.destX
						player.y = e.destY
						player.xvel = 0
						player.yvel = 0
						break
					end
				end
			end
		end
	end
	
	if key == "z" then
	
		if not textMode then
			for i, e in ipairs(room.entities) do
				if CheckCollision(player.x,player.y,player.width,player.height, e.x, e.y, e.width, e.height) then
					if (e.dialog ~= nil) then
						textMode = true
						
						randomIndex = love.math.random(#e.starts)
						startIndex = e.starts[randomIndex]
						currentText = e.dialog[startIndex]
						currentEntityTalking = e
						
						currentTextIndex = startIndex
						currentCharIndex = 1
						currentTextBuffer = ""
						stringDone = false
						convoDone = false
					end
				end
			end
		end
		
		if textMode then
			
			if dialogMenuMode then
				currentCharIndex = 1
				currentTextIndex = currentTextIndex + optionOffsets[menuOption]
				currentTextBuffer = ""
				currentText = currentEntityTalking.dialog[currentTextIndex]
				stringDone = false
				dialogMenuMode = false
				
			elseif convoDone then
				textMode = false
				
			elseif stringDone then
				currentCharIndex = 1
				currentTextIndex = currentTextIndex + 1
				currentTextBuffer = ""
				currentText = currentEntityTalking.dialog[currentTextIndex]
				stringDone = false
			end
		end
	end
end

function love.draw()
	render()
end