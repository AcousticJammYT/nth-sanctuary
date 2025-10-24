---@class ChurchDarkHighlightFX : FXBase
---@overload fun(...) : HighlightFX
local ChurchDarkHighlightFX, super = Class(FXBase)

function ChurchDarkHighlightFX:init(alpha, color, mask, settings, priority)
    super.init(self, priority)

    self.alpha = alpha or 0
    self.color = color or {1, 1, 1, 1}
    self.scale = settings["scale"] or 1
    self.thickness = settings["thickness"] or 1
    self.cutout = settings["cutout"]

    self.cutout_shader = Kristal.Shaders["Mask"]
    self.mask = mask
end

function ChurchDarkHighlightFX:getAlpha()
    return self.alpha
end

function ChurchDarkHighlightFX:getScale()
    return self.scale
end

function ChurchDarkHighlightFX:setColor(r, g, b, a)
    self.color = {r, g, b, a}
end

function ChurchDarkHighlightFX:getColor()
    return self.color[1], self.color[2], self.color[3]
end

function ChurchDarkHighlightFX:isActive()
    return super.isActive(self) and self:getAlpha() > 0
end

function ChurchDarkHighlightFX:draw(texture)
    local alpha = self:getAlpha()

    local object = self.parent

    Draw.setColor(1, 1, 1, 1)
    Draw.drawCanvas(texture)
    local mult_x, mult_y = object:getFullScale()
    mult_x = mult_x * self.thickness
    mult_y = mult_y * self.thickness

    local highlight = Draw.pushCanvas(texture:getWidth(), texture:getHeight())
	love.graphics.clear()
	local last_shader = love.graphics.getShader()
    local shader = Kristal.Shaders["AddColor"]

    love.graphics.stencil((function()
        local last_shader = love.graphics.getShader()
        love.graphics.setShader(Kristal.Shaders["Mask"])
		love.graphics.translate(0, 1 * mult_y)
        Draw.drawCanvas(texture)
        love.graphics.setShader(last_shader)
    end), "replace", 1)
    love.graphics.setStencilTest("less", 1)

    love.graphics.setShader(shader)
    shader:send("inputcolor", {self:getColor()})
    shader:send("amount", self.alpha)
	
    love.graphics.translate(0, 0)
    Draw.drawCanvas(texture)
    love.graphics.setStencilTest()
	
    Draw.popCanvas(true)

    love.graphics.setShader(last_shader)
    Draw.setColor(1, 1, 1)
    local mask_obj
    if not self.mask then
        mask_obj = self.parent
    elseif isClass(self.mask) then
        mask_obj = self.mask
    end
    local mask = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
    if type(self.mask) == "function" then
        local result = self.mask()
        if result then
            mask_obj = result
        end
    end
    if mask_obj then
        love.graphics.applyTransform(mask_obj.parent:getFullTransform())
        if mask_obj.drawMask then
            mask_obj:preDraw()
            mask_obj:drawMask()
            mask_obj:postDraw()
        else
            mask_obj:fullDraw(not self.draw_children)
        end
    end
    Draw.popCanvas()
    Draw.setColor(1, 1, 1)
    love.graphics.stencil(function()
        local last_shader = love.graphics.getShader()
        love.graphics.setShader(Kristal.Shaders["Mask"])
        Draw.draw(mask)
        love.graphics.setShader(last_shader)
    end, "replace", 1)
    love.graphics.setStencilTest("less", 1)
    Draw.setColor(1, 1, 1, 1)
    Draw.drawCanvas(highlight)
    love.graphics.setStencilTest()
    love.graphics.setShader()
end

return ChurchDarkHighlightFX