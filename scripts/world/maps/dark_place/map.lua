---@class Map.dark_place : Map
local map, super = Class(Map, "dark_place")

function map:init(world, data)
    super.init(self, world, data)
end

function map:onEnter()
    self.world.color = COLORS.black
	self.ripple_fx = RippleEffect()
	self.ripple_fx.layer = WORLD_LAYERS["bottom"]
	Game.world:addChild(self.ripple_fx)
end

function map:onExit()
    self.world.color = COLORS.white
end

---@param char Player
function map:onFootstep(char, num)
    if not char.is_player then return end
	Assets.playSound("step1", 1, 0.8)
    ---@type RippleEffect
    local x, y = char:getRelativePos(18/2, 72/2)
    -- TODO: I couldn't find the right numbers
	local sizemod = 1
    self.ripple_fx:makeRipple(x, y, 60, ColorUtils.hexToRGB("#4A91F6"), 220 * sizemod, 1, 18 * sizemod, 1999000, Game.world.player.moving_x * 1.05, Game.world.player.moving_y * 1.05)
	self.ripple_fx:makeRipple(x, y, 60, ColorUtils.hexToRGB("#4A91F6"), 140 * sizemod, 1, 15 * sizemod, 1999000, Game.world.player.moving_x * 1.05, Game.world.player.moving_y * 1.05)
end

return map