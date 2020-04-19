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
				destY = 192
			}
		}
	},
	
	{
		name="town",
		entities = {
			entityDoor:new{
				x=80,
				y=192,
				roomDestination = 2,
				destX = 128,
				destY = 368
			}
		},
		music = "sound/decaying_town_alt_mix.mp3"
	},
	
	{
		name="bhar",
		entities = {}
	}
}