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

characterMayorCutscene = entityCharacter:new{
	name = "Mayor",
	starts = {1},
	dialog = {
		"Oh, gods above, hear our plea. Oh, divine spirits, answer our call. In this dire time of need, heed our cries and grant us the power to breathe new life into this town!$e",
		"Behold, our new guardian!$e",
		"At last, hope has returned to this town. My utmost gratitude to you for your work.",
		"Thank you for playing this demo! If you would like to play more of this game, it probably won't ever be finished.",
		"Regardless, send us your complaints at toasted.oregano@mailfence.com and let us know what you think!$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/eagle/1.png"),
		love.graphics.newImage("sprite/eagle/2.png"),
		love.graphics.newImage("sprite/eagle/3.png"),
		love.graphics.newImage("sprite/eagle/4.png")
	}
}

characterIntro = entityCharacter:new{
	name = "",
	starts = {1},
	dialog = {
		"A hundred years ago, the land of Pastoria set their sights on a new home.",
		"Their target: a barren, lonely planet. They dubbed it Methenia.",
		"Using the powers of the Five Relics, the people travelled and made the planet theirs, forming a town.",
		"It seemed as if they could settle in and truly call it home. However, this was not to be.",
		"A great war fractured Pastoria, such that travel to the new planet ceased to be.",
		"While the colonists could subsist and survive on their own, their newfound isolation threatened to plunge them into an age of darkness.",
		"Can anyone rescue the townspeople from this cruel fate?$e"
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
	},
	yellowAnimFrames = {
		love.graphics.newImage("sprite/chest_indoor.png")
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
	x=96,
	y=128,
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
		"That's a nice box of cigars you got there.$q233",
		"Here, you can have all of them.",
		"Thanks. I'm planning on smoking them all when I get home.",
		"You're kidding, right? Smoking's terrible for your health. I just wanted the box.",
		"[Lowell took the box from you and left the cigars.]",
		"Anyways, here's the relic, kid, but if you hurt yourself with it, you're on your own.",
		"[You have obtained the Tidal Shield.]$e",
		"Grumble grumble.$e",
		"Hmphph,$e",
		"Three cheers for our pint-sized hero!$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/lowell_b.png")
	},
	yellowAnimFrames = {
		love.graphics.newImage("sprite/lowell.png")
	},
}

characterTanya = entityCharacter:new{
	name = "Tanya",
	x=80,
	y=32,
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
		"[You have obtained the Staff of Wind.]$e",
		"Humphus. You're pretty alright for a weirdo.$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/lizard/1y.png"),
		love.graphics.newImage("sprite/lizard/2y.png"),
		love.graphics.newImage("sprite/lizard/3y.png"),
		love.graphics.newImage("sprite/lizard/4y.png"),
	},
	yellowAnimFrames = {
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
	x=128,
	y=80,
	starts = {1},
	dialog = {
		"Hello there. I'm Dr. Tennant, the head physician of this clinic.$q234",
		"Nice to meet you.",
		"How come is it you go through time?",
		"Nice to meet you, too.$e",
		"I'm sorry, I believe you have the wrong person.",
		"At any rate, you seem to be in a hurry. What business do you have with me?$q234",
		"Can I get a flu shot?",
		"I seek the Earthen Gem.",
		"Unfortunately, we're all out. We haven't gotten supplies from Pastoria ever since the war broke out.$e",
		"Hand over the Earthen Gem? You must be mad. Maybe if you had the other relics, I would consider it.$e",
		"I see that you have the other four relics as well. In that case, I wish you the best of luck.",
		"[You have obtained the Earthen Gem.]$e",
		"An apple a day keeps me away!$e",
		"Goodness gracious, is that an apple you're holding? Guess I'd better keep my distance, then!$e",
		"I didn't think you had it in you, frankly. But you've done it, and I think that's an important lesson for us all.$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/doctor/doctor_1.png"),
		love.graphics.newImage("sprite/doctor/doctor_2.png"),
		love.graphics.newImage("sprite/doctor/doctor_3.png"),
		love.graphics.newImage("sprite/doctor/doctor_4.png")
	}
}

characterFish = entityCharacter:new{
	name = "Da Fish",
	x=352,
	y=-500,
	animFrames = {
		love.graphics.newImage("sprite/icthis.png"),
	}	
}

characterMayor = entityCharacter:new{
	name = "The Mayor",
	x=240,
	y=464,
	width=64,
	starts = {1},
	dialog = {
		"Ah, hello there! I'm the mayor of this town. Pleased to meet your acquaintance.$q243",
		"I seek the Blazing Blade.",
		"The pleasure is mine, sir.",
		"What a polite child you are.$e",
		"How plain your wording is! And yet, your intention is honest and forthcoming.",
		"Tell me, have you heard of the legend of the Five Relics?$q293",
		"I have.",
		"I have not.",
		"Very well then, let us start from the beginning.",
		"100 years ago, our forefathers made the perilous journey to this planet. With them, they brought five relics to tame the land and make it their own.",
		"The Earthen Gem, to ward off all disease... The Mask of Truth, to see through any deceit...",
		"The Staff of Wind, to cast spells of luck and propserity... The Tidal Shield, to wash away attacks from the Others...",
		"And lastly, the Blazing Blade, able to slice through even the thickest of thicks.",
		"With these five relics, our ancestors were able to cleanse this land.... but there was a cost, a grave one.",
		"You must already be on the path of obtaining the Relics. Allow me to help you on your quest.",
		"Once you have obtained all five Relics, come talk to me again.",
		"[You have obtained the Blazing Blade.]$e",

		"My heart is with you on your journey to gather the Relics.$e",
		"I have hope that our town can once again prosper.$e",
		-- 20 ending dialog
		"I see that you've gathered the five Relics. Excellent work. Let us gather the townspeople at the fountain, in order to perform the Ritual.$e",
		"Oh, gods above, hear our plea. Oh, divine spirits, answer our call. In this dire time of need, heed our cries and grant us the power to breathe new life into this town!$e",
		"Behold, our new guardian!$e",
		"At last, hope has returned to this town. My utmost gratitude to you for your work.",
		"Thank you for playing this demo! If you would like to play more of this game, it probably won't ever be finished.",
		"Regardless, send us your complaints at toasted.oregano@mailfence.com and let us know what you think!$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/eagle/1.png"),
		love.graphics.newImage("sprite/eagle/2.png"),
		love.graphics.newImage("sprite/eagle/3.png"),
		love.graphics.newImage("sprite/eagle/4.png")
	}
}

characterMonk = entityCharacter:new{
	x=208,
	y=576,
	width=48,
	name = "The Lonelious Monk",
	starts = {1},
	dialog = {
		"Wherefore hast thou sought me out?$q3456",
		"I seek wisdom.",
		"I seek strength.",
		"I seek the Mask of Truth.",
		"There is no wisdom, no hidden knowledge, no insight, other than that which there is no such thing.$e",
		"Strength hath no meanings, for none may overcome the death that awaits us all alike.$e",
		"As thou will. The fate of this relic means nothing to this ignorance of mine.",
		"[You have obtained the Mask of Truth.]$e",
		"Life is but a fleeting breath, drowning in a sea of sorrows.$e",
		"We exist merely to suffer and die.$e"
	},
	animFrames = {
		love.graphics.newImage("sprite/tigeridle/1.png"),
		love.graphics.newImage("sprite/tigeridle/2.png"),
		love.graphics.newImage("sprite/tigeridle/3.png"),
		love.graphics.newImage("sprite/tigeridle/4.png")
	}
}