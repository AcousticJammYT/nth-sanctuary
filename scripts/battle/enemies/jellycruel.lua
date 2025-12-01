local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Jellycruel"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("jellycruel")

    -- Enemy health
    self.max_health = 10000
    self.health = 10000
    -- Enemy attack (determines bullet damage)
    self.attack = 12
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = -999

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "jellycruel"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 99 DF 99\n* jellycruel"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* jellycruel.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The dummy looks like it's\nabout to fall over."

    -- Register act called "Smile"
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
end

function Dummy:onAct(battler, name)
    if name == "Standard" then --X-Action
        self:addMercy(0.1)
        return "* jellycruel."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Dummy