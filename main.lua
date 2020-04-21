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
	
	paused = true
	statScreen = false
	textMode = false
	titleScreen = true
	prologue = false
	
	dialogMenuMode = false
	menuOption = 1
	numberOfOptions = 3
	optionText = {}
	optionOffsets = {}
	inventorySlot = 1
	
	currentText = ""
	currentTextBuffer = ""
	currentCharIndex = 1
	currentTextIndex = 1
	currentEntityTalking = nil
	stringDone = false
	convoDone = false
	
	fadeInBlack = false
	fadeOutBlack = false
	fadeInWhite = false
	fadeOutWhite = false
	blackOverlayTimer = 0
	whiteOverlayTimer = 0
	fishFallTimer = -300
	
	relicCount = 0

	TILESIZE = 16
	SFX_VOLUME = 1
	
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
	"room/cave2",
	"room/shop",
	"room/town hall",
	"room/museum",
	"room/test_room"}
	
	sfx_jump = love.audio.newSource("sound/jump.mp3", "static")
	sfx_textblip = love.audio.newSource("sound/textblip.mp3", "static")
	sfx_itemget = love.audio.newSource("sound/itemget.mp3", "static")
	sfx_itemscroll = love.audio.newSource("sound/item_scroll.wav","static")
	sfx_itemselect = love.audio.newSource("sound/item_select.wav","static")
	npc1loop = love.audio.newSource("sound/npc_1_loop.wav","static")
	npc2loop = love.audio.newSource("sound/npc_2_loop.wav","static")
	npc3loop = love.audio.newSource("sound/npc_3_loop.wav","static")
	walk_loop = love.audio.newSource("sound/walk_loop.wav", "static")
	
	fish_music = love.audio.newSource("sound/fish.mp3", "stream")
	
	starfield = love.graphics.newImage("room/starfield.png")
	prologue1 = love.graphics.newImage("sprite/1.png")
	prologue2 = love.graphics.newImage("sprite/2.png")
	prologue3 = love.graphics.newImage("sprite/3.png")
	prologue4 = love.graphics.newImage("sprite/5.png")
	prologue5 = love.graphics.newImage("sprite/6.png")
	title = love.graphics.newImage("sprite/title.png")
	
	endingScene1 = false
	endingScene2 = false
	endingScene3 = false
	endingScene4 = false
	
	worldTick = 0
	gravity = 0.8
	
	playerSpeed = 1.5

	playerTileX = 0
	playerTileY = 0
	
	player_idle_frames = {}
	player_yellow_frames = {}
	playerAnimFrame = 1
	for i = 1, 4 do
		player_idle_frames[i] = love.graphics.newImage("sprite/player_idle" .. i .. ".png")
		player_yellow_frames[i] = love.graphics.newImage("sprite/player_yellow" .. i .. ".png")
	end

	cam_zoom = 3

	init_room(13)
	
end



function love.update(dt)
	
	worldTick = worldTick + 1
	map:update(dt) -- update map and everything and yeah
	
	if (fadeOutBlack) then
		blackOverlayTimer = math.min(blackOverlayTimer + 1, 200)
	end
	if (fadeInBlack) then
		blackOverlayTimer = math.max(blackOverlayTimer - 1, 0)
	end
	if (blackOverlayTimer == 0) then
		fadeInBlack = false
	end
	
	if (blackOverlayTimer == 200) and endingScene1 then
		startConvo(characterMayorCutscene)
		endingScene1 = false
		player.x = 420
		player.y = 140
		player.boundingBox.x = 420
		player.boundingBox.y = 140
		player.xvel = 0
		player.yvel = 0
		
		doc = characterDoctor:new{
			x=496,y=160
		}
		low = characterLowell:new{
			x=272,y=144
		}
		liz = characterTanya:new{
			x=208,y=176
		}
		cut = characterMayorCutscene:new{
			x=400,y=64
		}
		
		table.insert(room.entities,cut)
		table.insert(room.entities,doc)
		table.insert(room.entities,low)
		table.insert(room.entities,liz)
		
		room_music.stop(room_music)
	
	elseif (blackOverlayTimer == 0) and endingScene2 then
		endingScene2 = false
		fadeInBlack = false
		fadeOutBlack = false
		endingScene3 = true
		fish_music.play(fish_music)
		
	end
	if (endingScene3) then
		characterFish.y = math.min(characterFish.y + 5, 160)
		
		if characterFish.y == 160 then
			endingScene3 = false
			characterMayorCutscene.starts = {3}
			startConvo(characterMayor)
			characterMayor.starts = {23}
			characterDoctor.starts = {15}
			characterTanya.starts = {20}
			characterLowell.starts = {18}
			
			endingScene4 = true
		end
	end
	
	if (prologue) then
		startConvo(characterIntro)
		blackOverlayTimer = 100
		fadeOutBlack = true
		paused = true
		prologue = false
		prologueScreen = true
	end
	
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
					--walk_loop.play(walk_loop)
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
					--walk_loop.play(walk_loop)
				else
					player.xvel = player.xvel + 0.1
				end
			end
		else
			player.xvel = player.xvel / 1.05 -- Friction/deceleration
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
	
	if not paused and not textMode then -- Updates player position based on collision, or tries to at least
		player.boundingBox.x, player.boundingBox.y, cols, lenth = world:move(player.boundingBox, player.x + player.xvel, player.y + player.yvel)	
		
		if math.abs(player.yvel) > gravity * (0.5) and lenth > 0 then -- Player is grounded if colliding and yvel is close to the gravity coefficient
			player.grounded = true
			player.yvel = 0
		else
			player.grounded = false
		end
	end
	

	
	player.x = player.boundingBox.x
	player.y = player.boundingBox.y
	
	playerTileX = math.floor(player.x / TILESIZE) -- update tile pos
	playerTileY = math.floor(player.y / TILESIZE)
	playerTileX2 = math.ceil(player.x / TILESIZE) -- update tile pos
	playerTileY2 = math.ceil(player.y / TILESIZE)
	
    if (worldTick % 8 == 0) then -- Update animation
		playerAnimFrame = 1+(playerAnimFrame)%4
		
		for i, e in ipairs(room.entities) do
			e.currentAnimFrame = 1+(e.currentAnimFrame % #e.animFrames)
		end
	end
	
	if (worldTick % 32 >= 16) then
		characterMonk.y = characterMonk.y + 0.25
		characterMayor.y = characterMayor.y + 0.25
	else
		characterMonk.y = characterMonk.y - 0.25
		characterMayor.y = characterMayor.y - 0.25
	end
	
	relicCount = 0
	for i=1, #player.inventory do
		if player.inventory[i] == "Blazing Blade" or
			player.inventory[i] == "Tidal Shield" or
			player.inventory[i] == "Staff of Wind" or
			player.inventory[i] == "Mask of Truth" or
			player.inventory[i] == "Earthen Gem" then
			
			relicCount = relicCount + 1
		end
	end
	if relicCount == 4 then
		characterDoctor.starts = {11}
	end
	
	if relicCount == 5 then
		characterMayor.starts = {20}
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
						if currentEntityTalking.starts[1] == 1 then
							currentEntityTalking.starts[1] = 2
						end
						
						if (currentTextIndex == 15) then
							currentEntityTalking.starts = {16,17}
							table.insert(player.inventory, "Tidal Shield")
							sfx_itemget.play(sfx_itemget)
						end
						
					elseif currentEntityTalking.name == "Felix" then
						currentEntityTalking.starts = {11,12,13}
						
						if (currentTextIndex == 5) then -- Felix gives you gold
							player.gold = player.gold + 200
							sfx_itemget.play(sfx_itemget)
						end
						
					elseif currentEntityTalking.name == "Dr. Tennant" then
						if (currentTextIndex == 12) then
							table.insert(player.inventory, "Earthen Gem")
							sfx_itemget.play(sfx_itemget)
							characterDoctor.starts = {13}
						end
						
					elseif currentEntityTalking.name == "Tanya" then
						if (currentTextIndex == 19) then
							table.insert(player.inventory, "Staff of Wind")
							currentEntityTalking.dialog[6] = "Anyways, why'd you stop by?$q245",
							sfx_itemget.play(sfx_itemget)
						end
					
					elseif currentEntityTalking.name == "The Lonelious Monk" then
						if (currentTextIndex == 8) then
							table.insert(player.inventory, "Mask of Truth")
							currentEntityTalking.starts = {9,10},
							sfx_itemget.play(sfx_itemget)
						end
						
					elseif currentEntityTalking.name == "The Mayor" then
						if (currentTextIndex == 16) then
							table.insert(player.inventory, "Blazing Blade")
							currentEntityTalking.starts = {18,19},
							sfx_itemget.play(sfx_itemget)
						end
						
						if (currentTextIndex == 20) then -- when you have all 5 relics this initiates the ending
							
						end
						
					elseif currentEntityTalking.name == "Charles" then -- Simple shop code
						if (currentTextIndex == 13) then
							if (player.gold >= 50) then
								table.insert(player.inventory, "Hot Cheaters")
								player.gold = player.gold - 50
								sfx_itemget.play(sfx_itemget)
							else
								currentTextIndex = 15
								convoDone = false
							end
						elseif (currentTextIndex == 15) then
							if (player.gold >= 420) then
								table.insert(player.inventory, "Box of Cigars")
								player.gold = player.gold - 420
								sfx_itemget.play(sfx_itemget)
								characterLowell.starts = {9}
							else
								currentTextIndex = 15
								convoDone = false
							end
						end
						
					elseif currentEntityTalking.name == "Chest" then
						if (currentTextIndex == 4) then
							table.insert(player.inventory, "Cheezy Burger")
							sfx_itemget.play(sfx_itemget)
						else
							player.gold = player.gold + currentEntityTalking.drops[currentTextIndex]
						end
						if currentEntityTalking.drops[currentTextIndex] > 0 then
							sfx_itemget.play(sfx_itemget)
						end
						currentEntityTalking.starts = {5}
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
				
			elseif currentCharIndex > string.len(currentText) then -- last character in buffer, no control code
			
				if currentEntityTalking.name == "Lowell" then
					if (currentTextIndex == 13) then
							
						-- replaces the ccigar box with a bunch of cigars
						for i = 1, #player.inventory do
							if player.inventory[i] == "Box of Cigars" then
								table.remove(player.inventory, i)
							end
						end
						
						for i = 1, 12 do
							table.insert(player.inventory, "Cigar")
						end
						
						sfx_itemget.play(sfx_itemget)
					end
				end
			
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

	if titleScreen then
		if key == "z" or key == "enter" or key == "x" or key == "space" then
			titleScreen = false
			prologue = true
			init_room(1)
		end
	end
	
	if key == "c" or key == "enter" then
		if not paused and not textMode then
			paused = true
			statScreen = true
		
		else
			statScreen = false
			paused = false
		end
	end

	if dialogMenuMode then
		if key == "down" then
			menuOption = math.min(menuOption+1, numberOfOptions)
			sfx_itemscroll.play(sfx_itemscroll)
		end
		if key == "up" then
			menuOption = math.max(1, menuOption-1)
			sfx_itemscroll.play(sfx_itemscroll)
		end
	end

	if statScreen then
		if key == "down" then
			inventorySlot = math.min(inventorySlot+1, #player.inventory)
			sfx_itemscroll.play(sfx_itemscroll)
		end
		if key == "up" then
			inventorySlot = math.max(1, inventorySlot-1)
			sfx_itemscroll.play(sfx_itemscroll)
		end
	end

	if key == "up" then
		if not textMode and not paused then
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
	
		if not textMode and not paused then
			for i, e in ipairs(room.entities) do
				if CheckCollision(player.x,player.y,player.width,player.height, e.x, e.y, e.width, e.height) then
					if (e.dialog ~= nil) then
						startConvo(e)
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
				sfx_itemselect.play(sfx_itemselect)
				
			elseif convoDone then
				textMode = false
				
				if currentEntityTalking.name == "" and prologueScreen then
					
						prologueScreen = false
						paused = false
						fadeInBlack = true
						fadeOutBlack = false
						init_room(3)
					
				elseif (currentEntityTalking.name == "The Mayor") then
					if currentTextIndex == 20 then
						fadeOutBlack = true
						endingScene1 = true
						paused = true
					end
				elseif (currentEntityTalking.name == "Mayor") then
					if currentTextIndex == 1 then
						fadeInBlack = true
						fadeOutBlack = false
						endingScene2 = true
						
					elseif currentTextIndex == 2 then
						paused = false
					end
				end
				
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

function startConvo(e)
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

function love.draw()
	render()
end