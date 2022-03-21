function scr_player_hurt(obj){
	// This is the routine for being hurt.

	var a=sign(x-obj.x);	// a is the sign of Sonic's X position minus the hazard in question's X position.
	if a=0 a=1;				// If a would be 0, it defaults to 1 so that Sonic can never be flung straight upward.

	// Now, the routine for being hurt has to run through a series of checks. Depending on the result of the check, you will
	// get a different outcome.

	// If the character is already hurt, invincible, or blinking, exit.
	if (routine == 2 || invuln_timer || invinc_timer || super_flag) exit;

	// Else, if the character possesses a shield or has rings.
	else if (shield || p_rings)
	{
		if (shield)
			shield	=	0;			// The character's shield is removed.
		else
		{
			//scrRingLoss(min(32,p_rings),x,y-4);		// Lose all of your rings. (Up to 32 can be collected).
			p_rings = 0;								// Is this needed? rings are already brought to 0 in the script...
			audio_play_sound(S2_46_LoseRings,1,false);	// Play a different sound for losing rings.
		}
		routine	=	2;			// Set to hurt routine
	    status	|=	STA_INAIR;	// Set Air status bit
	    ysp		=	-4;			// The character is knocked upward.
	    xsp		=	2*a;		// The character is knocked backward.
		if (status&STA_WATER){
			ysp /= 2;
			xsp /= 2;
		}
		gsp			=	0;
		anim_ID		=	anim_player.hurt;
		invuln_timer =	120;

	    angle		=	0;			// Angle is set to rotate back to gravity_angle
	    move_lock   =   true;		// We cannot enter any input while hurt... SORRY! :P
	    audio_play_sound(S2_23_Hurt,1,false);
	}

	// If all else is false, the character dies.
	else scr_player_death();
}