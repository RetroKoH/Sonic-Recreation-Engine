function scr_player_hurt(obj){
	// This is the routine for being hurt.
	var a=sign(x-obj.x);		// a is the sign of Sonic's X position minus the hazard in question's X position.
	if a=0 a=anim_direction*-1;	// If a would be 0, it defaults to 1 so that Sonic can never be flung straight upward.

	// Now, the routine for being hurt has to run through a series of checks. Depending on the result of the check, you will
	// get a different outcome.

	// If the character is already hurt, invincible, blinking, or super, exit.
	if (routine >= 2 || invuln_timer || invinc_timer || super) exit;

	// Else, if the character possesses a shield or has rings.
	else if (powerups&POW_SHIELD || p_rings)
	{
		if (powerups&POW_SHIELD) {
			powerups&=POW_RMVSHIELDS;		// The character's shield is removed.
			instance_destroy(my_shield);	// Destroys the shield in the reserved object space
			audio_play_sound(sfx_Hurt,1,false);
		}
		else
		{
			scr_ring_loss(min(32,p_rings),x,y);			// Lose all of your rings. (Up to 32 can be collected).
			p_rings = 0;								// Clear ring count
			audio_play_sound(sfx_RingLoss,1,false);	// Play a different sound for losing rings.
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
	}

	// If all else is false, the character dies.
	else {
		if (object_get_parent(obj.object_index) == obj36_Spikes) scr_player_death(true);
		else scr_player_death();
	}
}