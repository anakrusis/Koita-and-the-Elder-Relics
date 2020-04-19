entity = {
	x = 0,
	y = 0,
	tileX = 0, 
	tileY = 0,
	
	animFrames = {}
}
function entity:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

player = entity:new()

player = {
	x = 32,
	y = 32,
	width = 16,
	height = 32,
	speed = 1,
	tileX = 0,
	tileY = 0,
	boundingBox = {x=32,y=32,w=15,h=32},
	
	animFrames = {},
	grounded = false,
	
	xvel = 0,
	yvel = 0,
	maxVel = 1
}