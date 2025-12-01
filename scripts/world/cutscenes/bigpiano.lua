return {
    histheme = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Aww,[wait:5] what a pretty melody![wait:5] It's like a lullaby...!", "blush_smile", "ralsei")
    end,

    yourbestfriend = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Aww,[wait:5] that song sounds so friendly and sweet!", "blush_smile", "ralsei")
    end,

    annoying = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Umm...[wait:5] that melody's a little...", "blush_smile", "ralsei")
        cutscene:text("* Annoying?", "blush_smile", "susie")
        cutscene:text("* UM...![wait:5] I wouldn't say that!", "blush_smile", "ralsei")
        cutscene:text("* Duh,[wait:5] YOU wouldn't.", "blush_smile", "susie")
    end,

    megalovania = function (cutscene)
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
        cutscene:fadeOut(0)
        Assets.playSound("hurt")
        cutscene:wait(1)
        toby:remove()
        cutscene:fadeIn(1)
        cutscene:wait(1)
    end,

    misc = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Dude,[wait:5] stop messing around!", "teeth_b", "susie")
    end,
    deox = function (cutscene)
		local ralsei = cutscene:getCharacter("ralsei")
		local susie = cutscene:getCharacter("susie")
		local jamm = cutscene:getCharacter("jamm")
		local jammf = Game:getFlag("jamm_join")
		cutscene:setSpeaker(ralsei)
		if not jamm then
			cutscene:text("* What a nice song...!", "blush_pleased")
			cutscene:text("* It feels... [wait:5]calm...", "blush_smile")
			if jammf then
				cutscene:text("* You should play this to Jamm, [wait:5]Kris!", "wink")
			end
		elseif jamm and jammf then
			cutscene:setSpeaker(jamm)
			cutscene:text("* Huh. [wait:10]That's familiar...", "neutral")
			cutscene:text("* (...Marcy...)", "worried_down")
			cutscene:setSpeaker(susie)
			cutscene:text("* You, [wait:5]uh.. [wait:10]alright, [wait:5]dude?", "nervous_side")
			cutscene:setSpeaker(jamm)
			cutscene:text("* [speed:0.2]...[speed:1]Yeah,[wait:5] just remembered something, [wait:5][face:look_left]is all.", "neutral")
			
		end

		
	end
}