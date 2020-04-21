entity = {
	x = 0,
	y = 0,
	width = 16,
	height = 16,
	tileX = 0, 
	tileY = 0,
	boundingBox = {x=32,y=32,w=15,h=32},
	
	animFrames = {},
	currentAnimFrame = 1,
	grounded = false,
	
	xvel = 0,
	yvel = 0,
	maxVel = 1
}
function entity:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

entityPlayer = entity:new()

player = entityPlayer:new{
	x = 32,
	y = 700,
	
	boundingBox = {x=32,y=700,w=15,h=32},
	width = 16,
	height = 32,
	speed = 1,

	attack = 5,
	defense = 5,
	speed = 5,
	toilet = 5,
	magic = 5,
	resistance = 5,
	hp = 5,
	gold = 0,
	
	doorTimer = 0,
	
	inventory = {}
	--inventory = {"Blazing Blade","Staff of Wind","Cigar","Tidal Shield","Mask of Truth"}
}


entityDoor = entity:new{
	width = 16,
	height = 32,
	grounded = true,
	roomDestination = 1
}