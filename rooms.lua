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
			
			characterFelix:new{
				x=116,
				y=704
			},
			characterMaurice:new{
				x=384,
				y=560
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
		},
	},
	
	{
		name = "elevator",
		entities = {
			entityDoor:new{
				
			}
		}
	},
	
	{
		name = "cave",
		entities = {
		}
	},
	
	{
		name = "cave2",
		entities = { 
		
		}
	},
	
	{
		name = "shop",
		entities = {
			
		}
	}
}