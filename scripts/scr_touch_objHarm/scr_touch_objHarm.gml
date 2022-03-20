function scr_touch_objHarm(){
	// This dictates Sonic's reactions to harmful objects. Sonic simply gets flung backwards, hurt... always.

	var obj = instance_place(x,y,objParent_Harm); // Parent object for harmful objects goes here.

	if (obj!=noone)// && state!=consStateHurt) // A hurt hedgehog will not react. That's just not fair.        
	{
		if (obj.can_harm) scr_player_hurt(obj); // If it CAN hurt you, it WILL.
		// Exceptions include SBZ electrocuters that power off and on.
	}
}