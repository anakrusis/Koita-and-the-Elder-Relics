-- This contains all the metadata for each room ,including the entities which are placed in it.

return {
	{
		name="test_room",
		entities = {},
		yellow = false,
		music = "sound/Prolog.ogg"
	},
	
	{
		name="heaven",
		entities = {
			entityDoor:new{
				x=128,
				y=368,
				roomDestination = 3,
				destX = 80,
				destY = 704
			}
		},
		music = "sound/shit.mp3",
		yellow = false
	},
	
	{
		name="town",
		entities = {
			entityDoor:new{ -- to the bar
				x=96,
				y=704,
				roomDestination = 4,
				destX = 192,
				destY = 128
			},
			entityDoor:new{ -- to the house
				x=336,
				y=704,
				roomDestination = 5,
				destX = 64,
				destY = 128
			},
			entityDoor:new{ -- to the clinic
				x=528,
				y=704,
				roomDestination = 6,
				destX = 64,
				destY = 256
			},
			entityDoor:new{ -- to the shop
				x=400,
				y=368,
				roomDestination = 10,
				destX = 176,
				destY = 128
			},
			entityDoor:new{ -- to the cave
				x=544,
				y=944,
				roomDestination = 8,
				destX = 80,
				destY = 192
			},
			entityDoor:new{ -- to city hall 11
				x=160,
				y=480,
				roomDestination=11,
				destX=176,
				destY=208
			},
			entityDoor:new{ -- to museum 12
				x=336,
				y=560,
				roomDestination=12,
				destX=192,
				destY=208
			},
			
			characterFelix:new{
				x=170,
				y=704
			},
			characterMaurice:new{
				x=384,
				y=560
			},
			characterMayor:new{
			},
			characterFish:new{
			},

			entityChest:new{
				x=560,
				y=880
			}
		},
		music = "sound/Decaying_Town.ogg",
		yellow = false
	},
	
	{
		name="bhar",
		entities = {
			entityDoor:new{ -- to town
				x=192,
				y=128,
				roomDestination=3,
				destX=80,
				destY=704
			},
			characterLowell:new{
			}
		},
		music = "sound/Bhar.ogg",
		yellow = true
	},
	
	{
		name="house",
		entities = {
			entityDoor:new{ -- to town
				x=64,
				y=128,
				roomDestination=3,
				destX=320,
				destY=704
			},
			characterTanya:new{
			},
			entityChest:new{
				x=224,
				y=144
			}
		},
		yellow = true
	},
	
	{
		name = "clinic",
		entities = {
			entityDoor:new{
				x=64,
				y=256,
				roomDestination=3,
				destX=512,
				destY=704
			},
			characterDoctor:new{
			}
		},
		music = "sound/Clinic.ogg",
		yellow = false
	},
	
	{
		name = "elevator", -- 7
		entities = {
			entityDoor:new{
				
			}
		},
		yellow = false
	},
	
	{
		name = "cave", -- 8
		entities = {
			entityDoor:new{
				x=80,
				y=192,
				roomDestination=3,
				destX=544,
				destY=944
			},
			entityDoor:new{
				x=400,
				y=176,
				roomDestination=9,
				destX=224,
				destY=112
			},
			entityChest:new{
				x=256,
				y=64
			},
			entityChest:new{
				x=384,
				y=368
			}
		},
		music = "sound/Caverns2.ogg",
		yellow = false
	},
	
	{
		name = "cave2",
		entities = { 
			entityDoor:new{
				x=224,
				y=112,
				roomDestination=8,
				destX=400,
				destY=176
			},
			characterMonk:new{

			}
		},
		music = "sound/Caverns2.ogg",
		yellow = false
	},
	
	{
		name = "shop", -- 10
		entities = {
			entityDoor:new{ -- to town
				x=176,
				y=128,
				roomDestination=3,
				destX=400,
				destY=368
			},
			characterShopOwner:new{
				x=128,
				y=128
			}
		},
		music = "sound/Shop.ogg",
		yellow = true
	},
	
	{
		name = "cityhall", -- 11
		entities = { 
			entityDoor:new{
				x=176,
				y=208,
				roomDestination=3,
				destX=160,
				destY=480
			},
			entityChest:new{
				x=64,
				y=224
			}
		},
		yellow = true
	},
	
	{
		name = "museum", -- 12
		entities = {
			entityDoor:new{
				x=192,
				y=208,
				roomDestination=3,
				destX=336,
				destY=560
			}
		},
		yellow = true
	},
	
	{
		name = "title", -- 13
		entities = {
		
		},
		music = "sound/Main_Theme.ogg"
	}
}