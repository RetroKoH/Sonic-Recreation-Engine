function scr_player_acquirefloor(){
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
	anim_ID=anim_player.walk;
	if (status&STA_SPIN)	// If Sonic is spinning
	{
	    status^=STA_SPIN;			// Clear spin status
	    y-=defaultHeight-height;
		height=defaultHeight;
	    width=WIDTH_MAIN;
		// walk animation set above
		
		// Isolate this part by character
		if object_index == obj01_Sonic scr_sonic_onfloor();
	}
	jump=false;
	itembonus=0;			// Clear item bonus
	double_jump_flag=false;
	double_jump_property=0;
}

function scr_sonic_onfloor(){
	if double_jump_flag {
		if (powerups&POW_BUBBLE) scr_bubble_bounce();
		else if !(powerups&POW_CHKELSHLDS) {
			if double_jump_property >= 20
				scr_drop_dash();
		}
	}
}

function scr_bubble_bounce(){
}

function scr_drop_dash(){
	status|=STA_SPIN;
	height=HEIGHT_ROLL;
	width=WIDTH_ROLL;
	anim_ID=anim_player.roll;
	if audio_is_playing(sfx_DropDash)
					audio_stop_sound(sfx_DropDash);
	audio_play_sound(sfx_DDRelease,1,false);
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