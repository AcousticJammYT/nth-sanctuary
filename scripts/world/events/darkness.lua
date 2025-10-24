local Darkness, super = Class(Event)

function Darkness:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    -- parallax set to 0 so it's always aligned with the camera
	self:setPosition(0, 0)
    self:setParallax(0, 0)
    -- don't allow debug selecting
    self.debug_select = false

    self.alpha = data.properties["alpha"] or 1
    self.overlap = true
	self.highlightalpha = 1
	self.draw_highlight = properties["highlight"] ~= false
end

function Darkness:postLoad()
    local characters = {}
    for _,chara in ipairs(self.stage:getObjects(Character)) do
		local basecol = COLORS["gray"]
		if Game:getPartyMember(chara.party) then
			basecol = Game:getPartyMember(chara.party).highlight_color or COLORS["gray"]
		end
		chara:addFX(ChurchDarkHighlightFX(self.alpha, basecol, self, "darkhighlight"))
    end
end

function Darkness:draw()
    local canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
    love.graphics.setColor(1-self.alpha, 1-self.alpha, 1-self.alpha)
    love.graphics.rectangle("fill",0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
    if self.overlap then
        love.graphics.setBlendMode("add")
    else
        love.graphics.setBlendMode("lighten", "premultiplied")
    end
    for _,light in ipairs(Game.stage:getObjects(TileObject)) do
		if light.light_area then
			light:drawLightB()
		end
    end
    love.graphics.setBlendMode("alpha")
    Draw.popCanvas(true)
	
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.setColor(1,1,1)
    love.graphics.draw(canvas)
    love.graphics.setBlendMode("alpha")
end

function Darkness:drawMask()
	for _,light in ipairs(Game.stage:getObjects(TileObject)) do
		if light.light_area then
			light:drawLightB()
		end
	end
end

return Darkness