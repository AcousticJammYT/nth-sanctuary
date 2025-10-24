return {
    moss1 = function (cutscene)
        local get = Game:getFlag("moss1")
        if not get then
            Game.world.music.volume = 0
            Assets.playSound("moss_fanfare")
            cutscene:text("* You found the [color:green]Moss!")
            Game.inventory:addItem("moss")
            Game.world.timer:tween(1, Game.world.music, {volume = 1})
            Game:setFlag("moss1", true)
        elseif get == true then
            cutscene:text("* (You already got the moss.)")
        end
    end,

    moss2 = function (cutscene)
        local get = Game:getFlag("moss2")
        if not get then
            Game.world.music.volume = 0
            Assets.playSound("moss_fanfare")
            cutscene:text("* You found the [color:9999ff]DuskMoss!")
            Game.inventory:addItem("duskmoss")
            Game.world.timer:tween(1, Game.world.music, {volume = 1})
            Game:setFlag("moss2", true)
        elseif get == true then
            cutscene:text("* (You already got the moss.)")
        end
    end,

    shard = function(cutscene)
        cutscene:wait(2)
        local this = BurstObj(Game.world.player.x, Game.world.player.y, {0.2, 0.2, 0.2}, "darkshard")
        this:setScale(2)
        Game.world:spawnObject(this)
    end,

    tobykillsyou = function (cutscene)
        local toby = Sprite("npcs/dogcar")
        toby:play()
        toby.x, toby.y = Game.world.player.x+400, Game.world.player.y - 80
        toby:setScale(2)
        Game.world:spawnObject(toby)
        cutscene:wait(1/4)
        					Assets.playSound("drive")
        toby:slideTo(toby.x - 400, toby.y, 1/2)
        cutscene:wait(1/2)
        local a = Game.world:getEvent("pianobig")
        a.con = 4
        Game.lock_movement = true
        cutscene:fadeOut(0, {music = true})
        Assets.playSound("hurt")
        cutscene:wait(1)
        toby:remove()
        cutscene:fadeIn(1, {music = true})
        cutscene:wait(1)
        Game.lock_movement = false
    end,
    prism = function (cutscene)
        local dd = cutscene:getCharacter("ddelta")
        cutscene:setSpeaker(dd)
        cutscene:text("* Oh, [wait:5]Delta Warriors! [wait:10]\n* You found me!")
        cutscene:text("* Your reward for coming so far to find me....")
        cutscene:wait(1)
        Game.world.music:pause()
        cutscene:text("* [speed:0.5]IS GETTING TOTALLY THRASHED")
        cutscene:text("* [speed:1](btw this isnt canon Ral just wants to show off the boss)", {auto = true})
        Game:encounter("3d")
        --Game.world.music:play()
    end
}