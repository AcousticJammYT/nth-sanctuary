return {
    end_die = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        Game.battle.music:stop()
        cutscene:battlerText(enemy, "Ugh.")
        cutscene:battlerText(enemy, "That hurt, not gonna lie.")
        cutscene:battlerText(enemy, "Listen.")
        cutscene:battlerText(enemy, "I know you're all scared.")
        cutscene:battlerText(enemy, "I know you want to escape this world \njust as much as I do.")
        cutscene:battlerText(enemy, "Before I go...[wait:10] Write this down.")
        cutscene:battlerText(enemy, "[wait:5]1")
        cutscene:battlerText(enemy, "[wait:5]6")
        cutscene:battlerText(enemy, "[wait:5]4")
        cutscene:battlerText(enemy, "[wait:5]7")
        cutscene:battlerText(enemy, "[wait:5]5")
        cutscene:battlerText(enemy, "[wait:5]0")
        cutscene:battlerText(enemy, "bye") 
        enemy:onDefeatFatal()
    end
}