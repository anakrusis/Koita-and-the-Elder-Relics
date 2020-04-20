entityCharacter = entity:new{
	name = "Character",
	width = 16,
	height = 32,
	starts = {1}, -- what indices the dialog might begin at (1 for default, otherwise can be random)
	dialog = {"Test$e"} -- what the character says
}

inventoryManager = entityCharacter:new{
	name = "Inventory",
	starts = {1,2,4},
	dialog = {
	
	}
}

entityChest = entityCharacter:new{
	name = "Chest",
	height = 16,
	starts = {1,2,3},
	drops = {100,500,50,0,0},
	dialog = {
		"[In the chest, you found 100G!]$e",
		"[In the chest, you found 500G!]$e",
		"[In the chest, you found 50G!]$e",
		"[In the chest, you found a Cheezy Burger!]$e",
		"[The chest is empty.]$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/chest_outdoor.png")
	}
}

characterMaurice = entityCharacter:new{
	name = "Maurice",
	starts = {1,2,4},
	dialog = {
	"I may be slow but I'm cool.$e", --1
	"Gotta go slow.",  --2
	"Relax, kick back, take a break... you know how it is.$e",
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
		"Kid. you got balls kid. Tell you what give me a box of cigars and I just might, give you it.$e",
		"That's a nice box of cigars you got there.$q"
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
		"Huh? What's that supposed to mean, you friggus?$q3465",
		"It's a legendary relic of yore.",
		"It's a long staff.",
		"It's a beautiful, dazzling rod that sparkles in the sunlight.",
		"Do I look like I pay attention in class?$e",
		"You're not making sense, goofus.$e",
		"Oh you mean this stupid stick?",
		"[You have obtained the Staff of Wind.]$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/lizard/1.png"),
		love.graphics.newImage("sprite/lizard/2.png"),
		love.graphics.newImage("sprite/lizard/3.png"),
		love.graphics.newImage("sprite/lizard/4.png"),
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
	},
	animFrames = {
		love.graphics.newImage("sprite/felix_1.png"),
		love.graphics.newImage("sprite/felix_2.png")
	}
}

characterShopOwner = entityCharacter:new{
	name = "Charles",
	starts = {1},
	dialog = {
		"Hey kiddo. Welcome to Shop. Guess what you do here.$q3746",
		"Buy items?",
		"Chat with you?",
		"Sell items?",
		"Nope. Now move it kid, I've got far more promising customers to tend to.",
		"...$e",
		"You're kidding, right? Do I look like a pawn shop owner to you?$e",
		"Yeah. What's it gonna be?$q3654",
		"Box of Cigars ------ 420G",
		"Hot Cheaters -------- 50G",
		"Nevermind",
		"Understandable, have a day.$e",
		"The name reminds me of my wife... heh.$e",
		"Cigars huh, I remember when I first got my hands on some of those...",
		"(He continues talking, but you block him out. You're too fixated on the cigar box.)$e",
		"Wait a minute... you ain't got enough money for that!$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/shop_owner.png")
	}
}

characterDoctor = entityCharacter:new{
	name = "Dr. Tennant",
	starts = {1},
	dialog = {
		"Hello there. I'm Dr. Tennant, the head physician of this clinic.$q234",
		"Nice to meet you.",
		"How come is it you go through time?",
		"Nice to meet you, too.$e",
		"I'm sorry, I believe you have the wrong person.",
		"At any rate, you seem to be in a hurry. What business do you have with me?$q234",
		"Can I get a flu shot?",
		"I seek the Earthen Cloak.",
		"Unfortunately, we're all out. We haven't gotten supplies from Pastoria ever since the war broke out.$e",
		"Hand over the Earthen Cloak? You must be mad.$e",
		"I see that you have the other four relics as well. In that case, I wish you the best of luck.",
		"[You have obtained the Earthen Cloak.]"
	},
	animFrames = {
		love.graphics.newImage("sprite/doctor/doctor_1.png"),
		love.graphics.newImage("sprite/doctor/doctor_2.png"),
		love.graphics.newImage("sprite/doctor/doctor_3.png"),
		love.graphics.newImage("sprite/doctor/doctor_4.png")
	}
}