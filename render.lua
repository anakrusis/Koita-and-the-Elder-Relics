function render()

	if (room.name == "town") then -- Parallax town background
		love.graphics.setColor(1,1,1)
		love.graphics.draw(starfield,tra_x(0)/2,tra_y(0)/2,0,cam_zoom,cam_zoom)

	end

	love.graphics.setColor(1, 1, 1)
	
	mapRenderX = (love.graphics.getWidth() / 2 / cam_zoom) - player.x -- MAP DRAWING
	mapRenderY = (love.graphics.getHeight() / 2 / cam_zoom) - player.y
	map:draw(mapRenderX,mapRenderY,cam_zoom,cam_zoom) -- tx, ty, sx, sy
	
	for i, e in ipairs(room.entities) do -- RENDERING ALL NON PLAYER ENTITIES
		if (e.yellowAnimFrames ~= nil) and room.yellow then
			love.graphics.draw(e.yellowAnimFrames[e.currentAnimFrame], tra_x(e.x), tra_y(e.y), 0, cam_zoom, cam_zoom)
			
		elseif (e.animFrames[e.currentAnimFrame] ~= nil) then
			love.graphics.draw(e.animFrames[e.currentAnimFrame], tra_x(e.x), tra_y(e.y), 0, cam_zoom, cam_zoom)
		else
			--love.graphics.draw(player_idle_frames[1], tra_x(e.x), tra_y(e.y), 0, cam_zoom, cam_zoom)
		end
	end
	
	if not titleScreen then
		if room.yellow then
			love.graphics.draw(player_yellow_frames[playerAnimFrame], tra_x(player.x), tra_y(player.y), 0 , cam_zoom, cam_zoom) -- Player
		else
			love.graphics.draw(player_idle_frames[playerAnimFrame], tra_x(player.x), tra_y(player.y), 0 , cam_zoom, cam_zoom) -- Player
		end
	end
	
	if (fadeOutBlack) or (fadeInBlack) then
		love.graphics.setColor(0,0,0,blackOverlayTimer/100)
		love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
	end
	
	if room.yellow then
		love.graphics.setColor(1,1,0.333)
	else
		love.graphics.setColor(1,1,1)
	end
	
	if not prologueScreen and not titleScreen then
		love.graphics.print(player.gold .. "G", 16, 16)
		love.graphics.print("Relics: " .. relicCount, 16, 48)
	end
	
	--love.graphics.print(currentTextIndex, 0, 0)
	--love.graphics.print("", 0, 32)
	
	if textMode then
		
		topMargin = love.graphics.getHeight()*0.60
	
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", 0, topMargin, love.graphics.getWidth(), 300)
		
		if room.yellow then
			love.graphics.setColor(1,1,0.333)
		else
			love.graphics.setColor(1,1,1)
		end
		
		love.graphics.printf(currentTextBuffer, 16, topMargin + 36, love.graphics.getWidth() - 16)
		
		if dialogMenuMode then
			
			for i = 1, numberOfOptions do
				love.graphics.printf(optionText[i], 32, topMargin + 96 + (i*32), love.graphics.getWidth()-16)
				if (i == menuOption) then
					love.graphics.print(">", 8, topMargin+96+(i*32))
				end
			end
		end
		
		if not prologueScreen then
			love.graphics.print(currentEntityTalking.name .. ":", 16, topMargin)
		end
		
		if prologueScreen then
			if currentTextIndex == 1 or currentTextIndex == 2 then
				love.graphics.draw(prologue1, 128, 0, 0, 3, 3)
			
			elseif currentTextIndex == 3 then
				love.graphics.draw(prologue2, 128, 0, 0, 3, 3)
				
			elseif currentTextIndex == 4 or currentTextIndex == 5 then
				love.graphics.draw(prologue3, 128, 0, 0, 3, 3)
				
			elseif currentTextIndex == 6 then
				love.graphics.draw(prologue4, 128, 0, 0, 3, 3)
			elseif currentTextIndex == 7 then
				love.graphics.draw(prologue5, 128, 0, 0, 3, 3)
			end
		end
	end
	
	if statScreen then
		love.graphics.setColor(0,0,0)
		topMargin = love.graphics.getHeight()*0.50
		love.graphics.rectangle("fill", 32, topMargin-8, love.graphics.getWidth() - 100, 200)
		
		if room.yellow then
			love.graphics.setColor(1,1,0.333)
		else
			love.graphics.setColor(1,1,1)
		end
		love.graphics.print("Inventory", 64, topMargin)
		love.graphics.print("Stats", 480, topMargin)
		for i = -1, 2 do
			index = inventorySlot+i
			if (player.inventory[index] ~= nil) then
				love.graphics.printf(player.inventory[index], 64, topMargin + 64 + (i*32), love.graphics.getWidth()-16)
				if (i == 0) then
					love.graphics.print(">", 40, topMargin+64+(i*32))
				end
			end
		end
	end
	
	if titleScreen then
		love.graphics.setColor(1,1,1)
		love.graphics.draw(title, 16, 0, 0, 4, 4)
	end
end