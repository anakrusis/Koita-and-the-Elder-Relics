entityCharacter = entity:new{
	name = "Character",
	width = 16,
	height = 32,
	starts = {1}, -- what indices the dialog might begin at (1 for default, otherwise can be random)
	dialog = {"Test$e"} -- what the character says
}

characterMaurice = entityCharacter:new{
	name = "Maurice",
	starts = {1,2,4},
	dialog = {
	"I may be slow but I'm cool.$e", --1
	"Gotta go slow.",  --2
	"Relax, kick back, take a break... you know the drill.$e",
	"You're too fast. Why don't you slow down and enjoy life a little?$e" --4
	},
	animFrames = {
		love.graphics.newImage("sprite/maurice.png")
	},
	currentAnimFrame = 1
}

characterLowell = entityCharacter:new{
	name = "Lowell",
	starts = {1},
	dialog = {
		"If yer lookin' for someone to drink Space Beer with, then scram because I ain't yer type.$e",
		"Good riddance you again. I told you to get lost I told you.$q3456",
		"Oh, sorry.",
		"No wait, hold on!",
		"I seek the Tidal Shield.",
		"Yeah you're sorry. Now go away kid.$e", -- 6
		"Well, I don't got've all day, kiddo. Go home and play in your Malo games or whatever.$e", -- 7
		"Kid. you got balls kid. Tell you what give me a box of cigarillos and I just might, give you it.$e",
		"That's a nice box of cigarillos you got there.$q"
	},
	animFrames = {
		love.graphics.newImage("sprite/lowell.png")
	},
}

characterTanya = entityCharacter:new{
	name = "Tanya",
	starts = {1},
	dialog = {
		"Oh, hey, I know you! You're that weird kid from across the street!$q243",
		"It's me.",
		"I'm not weird!",
		"Eh heh heh, I'm sure you aren't.",
		"...",
		"Anyways, why'd you stop by?$q3456",
		"I just felt like it",
		"I wanted to know you better",
		"I seek the Staff of the Wind.",
		"Humphus. You sure are weird.$e",
		"Eek! That's creepy!$e",
		"Huh? What's that supposed to mean, you friggus?$e",
	},
	animFrames = {
		--love.graphics.newImage("sprite/tanya.png")
	}
}

characterFelix = entityCharacter:new{
	name = "Felix",
	starts = {1},
	dialog = {
		"I like to play piano! But I've got a long way to go before I can get better.$q253",
		"Just give up.",
		"You're pretty good.",
		"Gosh, do you really mean that? Thank you so much!",
		"[Felix gave you 200G.]$e",
		"[The cat proceeds to stratch you in the face.]$q234",
		"Wow, I feel so exfoliated.",
		"Ouch, that hurt!",
		"It's what I do.$e",
		"Gosh, I'm so sorry! I didn't mean to.$e",
		"Oh gosh, I love playing keyboard!$e",
		"Do you have any catnip for me?$e",
		"School is boring! Piano is more fun!$e"
	}
}