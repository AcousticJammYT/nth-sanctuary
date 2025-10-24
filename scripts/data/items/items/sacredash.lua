local item, super = Class(HealItem, "sacredash")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Sacred Ash"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"

    -- Battle description
    self.effect = "Revives &\nHeals All"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Exotic ash made of the rarest wood.\nRevives and heals everyone."

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none/nil)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "It got in my nose!!",
        noelle = "I don't think we should eat this???",
        ralsei = "It's so soft...",
        jamm = "Huh. Neat."
    }
end

function item:getHealAmount(id)
    local party_member = Game:getPartyMember(id)

    if not party_member then
        return self.heal_amount -- Fallback
    end

    return 9999
end

--function item:onBattleUse(user, target)
--        for _,party_member in ipairs(Game.party) do
--        party_member:heal(9999)
--    end
--    return true
--end

return item