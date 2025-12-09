return {
    frisk = function (cutscene)
        if Game:getFlag("fun") ~= 69 then
            cutscene:text("* (Holy shit it's Frisk from the game UNDERTALE.)")
        else
            cutscene:text("* (It's some sort of [image:npcs/frisk/fafa, 0,0,2,2].)")
        end
    end,
}