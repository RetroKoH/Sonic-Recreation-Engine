function scr_player_acquirefloor(){
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
	anim_ID=anim_player.walk;
	jump=false;
	// Clear item bonus
	if (status&STA_SPIN)	// If Sonic is spinning
	{
	    status^=STA_SPIN;			// Clear spin status
	    height=defaultHeight;
	    width=9;
		// walk animation set above
		y-=defaultHeight-height;
		if double_jump_flag {
			if (powerups&POW_BUBBLE) scr_bubble_bounce();
			else if !(powerups&POW_CHKELSHLDS) {
				if double_jump_property >= 20
					scr_drop_dash();
			}
			double_jump_flag = false;
			double_jump_property = 0;
		}
	}
}

function scr_bubble_bounce(){
}

function scr_drop_dash(){
	status|=STA_SPIN;
	height=$E;
	width=7;
	anim_ID=anim_player.roll;
	y+=defaultHeight-height;
	var drop_spd = 8, drop_max = 12;
	
	// Forward
	if sign(xsp)==anim_direction
		gsp = (gsp / 4) + (drop_spd * anim_direction);
	// Backward
	else {
		if angle = 0
			gsp = drop_spd * anim_direction
		else
			gsp = (gsp / 2) + (drop_spd * anim_direction)
	}
	gsp = clamp(gsp,-drop_max,drop_max);
}