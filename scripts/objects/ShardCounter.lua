
---@class ShardCounter : Object
---@overload fun(...) : ShardCounter
local ShardCounter, super = Class(Object)

function ShardCounter:init()
    super.init(self)

    local shards = Game:getFlag("shards") or 0
    self.counter = Text("[image:ui/menu/icon/shard, 0, 0, 2, 2]  "..shards)
    self:addChild(self.counter)
    self.parallax_x = 0
    self.parallax_y = 0
    self.layer = WORLD_LAYERS["top"]

    self.x, self.y = 650, 45

    self:slideTo(635-self.counter:getTextWidth(), self.y, 0.3, 'out-circ')
end

function ShardCounter:transOut()
    self:slideTo(650, self.y, 0.3, 'out-circ')
    Game.stage.timer:after(0.3, function()
    self:remove()
    end)
end

return ShardCounter