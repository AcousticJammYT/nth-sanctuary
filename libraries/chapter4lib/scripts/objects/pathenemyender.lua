local PathEnemyEnder, super = Class(Event, "PathEnemyEnder")

function PathEnemyEnder:init(data)
    super.init(self, data)
	self.pathender = true
end

return PathEnemyEnder