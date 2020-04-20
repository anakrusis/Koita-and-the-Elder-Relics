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
		if (e.animFrames[e.currentAnimFrame] ~= nil) then
			love.graphics.draw(e.animFrames[e.currentAnimFrame], tra_x(e.x), tra_y(e.y), 0, cam_zoom, cam_zoom)
		else
			love.graphics.draw(player_idle_frames[1], tra_x(e.x), tra_y(e.y), 0, cam_zoom, cam_zoom)
		end
	end
	
	love.graphics.draw(player_idle_frames[playerAnimFrame], tra_x(player.x), tra_y(player.y), 0 , cam_zoom, cam_zoom) -- Player
	
	if (hitbox_debug_draw) then -- debug hitbox drawing
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
	end
	
	love.graphics.print(player.gold .. "G", 16, 16)
	
	--love.graphics.print(currentTextIndex, 0, 0)
	--love.graphics.print("", 0, 32)
	
	if textMode then
		
		topMargin = love.graphics.getHeight()*0.65
	
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", 0, topMargin, love.graphics.getWidth(), 200)
		love.graphics.setColor(1,1,1)
		love.graphics.printf(currentTextBuffer, 16, topMargin + 8, love.graphics.getWidth() - 16)
		
		if dialogMenuMode then
			
			for i = 1, numberOfOptions do
				love.graphics.printf(optionText[i], 32, topMargin + 64 + (i*32), love.graphics.getWidth()-16)
				if (i == menuOption) then
					love.graphics.print(">", 8, topMargin+64+(i*32))
				end
			end
		end
		
		love.graphics.print(currentEntityTalking.name .. ":", 16, topMargin - 32)
	end
	
	if statScreen then
		love.graphics.setColor(0,0,0)
		topMargin = love.graphics.getHeight()*0.50
		love.graphics.rectangle("fill", 32, topMargin-8, love.graphics.getWidth() - 100, 200)
		
		love.graphics.setColor(1,1,1)
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
end