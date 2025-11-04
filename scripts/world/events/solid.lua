---@overload fun(...) : Transition
local PlotSolid, super = Class(Event)

function PlotSolid:init(data)
    super.init(self, data)

    self.solid = true
end

return PlotSolid