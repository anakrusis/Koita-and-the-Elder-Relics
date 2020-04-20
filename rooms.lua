-- This contains all the metadata for each room ,including the entities which are placed in it.

return {
	{
		name="test_room",
		entities = {}
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
		music = "sound/shit.mp3"
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
			
			characterFelix:new{
				x=170,
				y=704
			},
			characterMaurice:new{
				x=384,
				y=560
			},
			
			entityChest:new{
				x=560,
				y=880
			}
		},
		music = "sound/decaying_town_ja.mp3"
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
				x=96,
				y=128
			}
		}
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
				x=80,
				y=32
			}
		}	
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
				x=128,
				y=80
			}
		},
	},
	
	{
		name = "elevator", -- 7
		entities = {
			entityDoor:new{
				
			}
		}
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
		}
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
			}
		}
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
		}
	}
}