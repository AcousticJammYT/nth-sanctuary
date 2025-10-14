local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 12
	self.count = 0
	self.siner = 0
	self.flybullets = {}
	self.bullet_angle = math.rad(-90)
	self.bullet_speed = 5
	self.start_rotating = true
	self.arena_width = 122
	self.arena_height = 122
end

function Basic:onStart()
    -- Every 0.33 seconds...
    self.spawned = {}
    local arena = Game.battle.arena
    local a, b = arena:getCenter()
	self.timer:everyInstant(0.35, function()
		self.count = self.count + 1
		local player_aim = false
		if self.count % 5 == 0 then
			player_aim = true
		end
		if self.start_rotating and not player_aim then
			self.bullet_angle = self.bullet_angle + math.rad(8 * DTMULT)
		end
		--[[local xx = -math.cos(self.bullet_angle) * MathUtils.random(arena.left, arena.right)
		local yy = -math.sin(self.bullet_angle) * MathUtils.random(arena.top, arena.bottom)
		xx = xx + -math.cos(self.bullet_angle) * SCREEN_WIDTH
		yy = yy + -math.sin(self.bullet_angle) * SCREEN_HEIGHT]]
		local xx = -math.cos(self.bullet_angle) * 150
		local yy = -60 - math.sin(self.bullet_angle) * 200
		if player_aim then
			self.g = self:spawnBullet("3d/smallcube", SCREEN_WIDTH/2 + xx, SCREEN_HEIGHT/2 + yy, Utils.angle(arena.x + xx, SCREEN_HEIGHT/2 + yy, Game.battle.soul.x, Game.battle.soul.y), 0)
			self.g.player_aim = true
			self.g.draw_trails = true
			Assets.playSound("spearappear", 1, MathUtils.random(0.8, 0.9))
		else
			self.g = self:spawnBullet("3d/trailcube", SCREEN_WIDTH/2 + xx, SCREEN_HEIGHT/2 + yy, self.bullet_angle, 0, 10)
			self.g.moveadd = 1
			if self.count % 2 == 1 then
				self.g.moveadd = -1
			end
			Assets.playSound("3dprism_cubetravel", 0.8, MathUtils.random(0.8, 1.2))
		end
		self.g.xmove = TableUtils.pick({0,1,2,3})
		self.g.con = 1
		self.g.alpha = 0
		Game.battle.timer:tween(8/30, self.g, {alpha = 1}, "linear")
		table.insert(self.flybullets, self.g)
	end)
end

function Basic:onEnd()
	Assets.stopSound("3dprism_cubetravel")
end

function Basic:update()
    -- Code here gets called every frame
    super.update(self)
	self.siner = self.siner + DTMULT
	self.bullet_speed = self.bullet_speed + 2 * DTMULT
	if self.bullet_speed >= 10 then
		self.bullet_speed = 10
	end
    for i,bullet in ipairs(self.flybullets) do
		if self.start_rotating and not bullet.player_aim then
			bullet.physics.direction = bullet.physics.direction + math.rad(bullet.moveadd*(self.bullet_speed/10) * DTMULT)
		end
		bullet.x = bullet.x + -math.cos(bullet.physics.direction) * (-self.bullet_speed * DTMULT)
		bullet.y = bullet.y + -math.sin(bullet.physics.direction) * (-self.bullet_speed * DTMULT)
		if bullet.xmove >= 2 then
			if bullet.xmove == 3 then
				bullet.x = bullet.x - -math.cos(bullet.physics.direction-math.rad(90)) * math.cos(self.siner/10)*2
				bullet.y = bullet.y - -math.sin(bullet.physics.direction-math.rad(90)) * math.cos(self.siner/10)*2
			else
				bullet.x = bullet.x + -math.cos(bullet.physics.direction-math.rad(90)) * math.cos(self.siner/10)*2
				bullet.y = bullet.y + -math.sin(bullet.physics.direction-math.rad(90)) * math.cos(self.siner/10)*2
			end
		else
			if bullet.xmove == 1 then
				bullet.x = bullet.x - -math.cos(bullet.physics.direction-math.rad(90)) * math.sin(self.siner/10)*2
				bullet.y = bullet.y - -math.sin(bullet.physics.direction-math.rad(90)) * math.sin(self.siner/10)*2
			else
				bullet.x = bullet.x + -math.cos(bullet.physics.direction-math.rad(90)) * math.sin(self.siner/10)*2
				bullet.y = bullet.y + -math.sin(bullet.physics.direction-math.rad(90)) * math.sin(self.siner/10)*2
			end
		end
	end
end

return Basic