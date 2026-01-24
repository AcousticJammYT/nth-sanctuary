return {
    fountain = function(cutscene, event)
		if not Game:getFlag("interactedWithFountain", false) then
			cutscene:text("* (It's a pool of water. ...[wait:5] huh?)")
			cutscene:text("* (A feather drifted into it...[wait:5] and turned into coins!)")
			cutscene:text("* (Throw something inside?)")
			Game:setFlag("interactedWithFountain", true)
		else
			cutscene:text("* (It's a pool of water. Throw something in?)")		
		end
        Game:enterShop("toss_fountain")
    end
}
