local Basic, super = Class(Wave)
function Basic:init()
    super.init(self)
    self.time = 20
    self:setArenaSize(150, 50)
end

function Basic:onStart()
    -- Every 0.33 seconds...
    self.timer:every(1, function()
        local attackers = self:getAttackers()

        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do

            -- Get the attacker's center position
            local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

            -- Get the angle between the bullet position and the soul's position

            -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
            local a = self:spawnBullet("jellycruel_bullet_1", x, y, math.rad(225), 8)
            self.timer:after(1, function()
                for i = 1,6 do
                    local b = self:spawnBullet("jellycruel_bullet_1", a.x, a.y, math.rad(-90+love.math.random(-50, 10)), 8)
                    b:setSprite("enemies/jellycruel/idle")
                    b.physics.gravity = 1
                    b.sprite:setScale(0.3)
                    
                    a:remove()
                end
            end)
        end
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic