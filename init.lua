local sti = require "sti"
local bump = require "bump"

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
		room_music.setVolume(room_music, 0.7)
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