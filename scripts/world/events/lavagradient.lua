local LavaGradient, super = Class(Event)

function LavaGradient:init(data)
    super.init(self, data)
	local properties = data and data.properties or {}
	self.texture = Assets.getTexture("backgrounds/gradient20")
	self.grad_scale = properties["scale"] or 1.5
	self.additive = properties["additive"] or false
	self.color = properties["color"] and TiledUtils.parseColorProperty(properties["color"]) or COLORS.white
	self.debug_select = false
	self.y = self.y + 40
	self.timer = 0
end

function LavaGradient:update()
    super.update(self)
	if self.world.map.lava_alpha then
		self.alpha = 0.5 + self.world.map.lava_alpha
	end
	if self.world.map.lava_grad_scale then
		self.scale_y = self.world.map.lava_grad_scale + self.grad_scale
	else
		self.timer = self.timer + DTMULT
		self.scale_y = (math.sin(self.timer / 10) * 0.5) + self.grad_scale
	end
end

function LavaGradient:draw()
    super.update(self)
	if self.world.color == COLORS.black then return	end
	if self.additive then
		love.graphics.setBlendMode("add")
	end
	Draw.draw(self.texture, 0, 0, 0, self.width/20, self.scale_y, 0, 20)
	love.graphics.setBlendMode("alpha")
end

return LavaGradient