return {
    fountain = function(cutscene)
        Game.shop:setState("NONE")
        Game:setFlag("waterboarded", true)
        Game.world.music:pause()
        Assets.playSound("swallow")
        local fakeFader = Rectangle(0,0,999,999)
        fakeFader:setColor(0,0,0,1)
        fakeFader.alpha = 0
        fakeFader.layer = SHOP_LAYERS["dialogue"]-1
        Game.world:addChild(fakeFader)
        Game.world.timer:tween(1, fakeFader, {alpha = 1})
        cutscene:wait(2)
        
        cutscene:text("[sound:swallow]* (You decide to keep drinking.)")
        cutscene:text("[sound:swallow]* (You let the greed get to you...)")
        cutscene:text("[sound:swallow]* (And slowly, [wait:5]you began to turn into coins...)")
        cutscene:wait(1)
        Game.world.timer:tween(1, fakeFader, {alpha = 0})
        Game.world.music:play()
        cutscene:text("* (...Kidding.)")
        fakeFader:remove()
        cutscene:after(function() 
        Game.shop:setState("MAINMENU") end)
    end
}