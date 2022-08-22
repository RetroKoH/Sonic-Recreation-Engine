function scr_sonic_doublejump(){
	if !double_jump_flag {
		if global.k_abc_p {
			status&=~STA_ROLLJUMP;	// Clear roll jump status
			if (super || powerups&POW_INVINC) double_jump_flag = true; // just stop here
			else if powerups&POW_FLAME		scr_sonic_flameshield();
			else if powerups&POW_BUBBLE		scr_sonic_bubbleshield();
			else if powerups&POW_LIGHTNING	scr_sonic_lightningshield();
			// else if emeralds == 7 && rings >= 50 scr_sonic_super();
			else if !powerups&POW_SHIELD	scr_sonic_instashield();
			else double_jump_flag = true; // stop here
		}
	}

	// If already 1, Check for Drop Dash
	else {
		if !(powerups&POW_CHKELSHLDS) && (double_jump_property >= 0)  // If we have ELEMENTAL shields, disable this...
		{
			if global.k_abc_h {
				double_jump_property = min(double_jump_property+1, 20);
				if double_jump_property >= 20
					anim_ID = anim_player.spindash;
			}
			else double_jump_property = -1; // Cancels Drop Dash
		}
	}
}

// Elemental Shield Jumps
function scr_sonic_flameshield(){
	//shield.anim_ID = 1;
	double_jump_flag = true;
	xsp = 8*anim_direction;
	gsp = xsp;
	ysp = 0;
	// Play sound
}
function scr_sonic_bubbleshield(){
/*On steep slopes, the bubble shield is unlikely to bounce at the right angle.
That's because this bounce happens AFTER Sonic lands and has calculated his new Ground Speeds
and new X Speed and Y Speed from landing on the ground. On steep slopes, this landing Y Speed
is likely to be high (downwards), effectively cancelling out a lot of the bounce Y Speed.*/
	//shield.anim_ID = 1;
	double_jump_flag = true;
	xsp = 0;
	gsp = 0;
	ysp = 8;		// Rebound force is 7.5 (adjusted for angle)
	// Play sound
}
function scr_sonic_lightningshield(){
	//shield.anim_ID = 1;
	double_jump_flag = true;
	ysp = -5.5;
	jump = false;	// Clear flag to avoid variable jump height
	// Play sound
}
function scr_sonic_instashield(){
	if !(powerups&POW_SHIELD) instance_create_layer(player.x,player.y,"Instances",obj38_Shield_Insta);
	double_jump_flag = true;
	// Play sound
}