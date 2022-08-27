// Needs proper S3K implementation
function scr_player_acquirefloor(){
	height=defaultHeight;
	width=WIDTH_MAIN;
	anim_ID=anim_player.walk;
	if (status&STA_SPIN)	// If Sonic is spinning
	{
		status^=STA_SPIN;			// Clear spin status
		y-=defaultHeight-height;
		// Isolate this part by character
		if object_index == obj01_Sonic scr_sonic_onfloor();
		else if (object_index == obj01_Mighty && double_jump_flag==1) {
			scr_drilldive_rebound();
			exit;
		}
	}
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
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

// Needs to be tested
function scr_bubble_bounce(){
	var bounce = !(status&STA_WATER) ? 7.5 : 4;
	xsp -= bounce * sin(angle);
	ysp -= bounce * cos(angle);
	status |= STA_INAIR;
	status &=~ STA_PUSH;
	jump = true;
	convex = false;
	height = HEIGHT_ROLL;
	width = WIDTH_ROLL;
	anim_ID = anim_player.roll;
	status |= STA_SPIN;
	y -= defaultHeight-height;
	// Shield animation
	audio_play_sound(sfxS3K44_BubbleBounce,1,false);
}

// Needs to be fixed
function scr_drilldive_rebound(){
	var bounce = !(status&STA_WATER) ? 1.5625 : 1; // Fix these speeds
	xsp -= bounce * sin(angle);
	ysp -= bounce * cos(angle);
	status |= STA_INAIR;
	status &=~ STA_PUSH;
	jump = true;
	convex = false;
	itembonus=0;								// Clear item bonus
	height = HEIGHT_ROLL;
	width = WIDTH_ROLL;
	anim_ID = anim_player.roll;
	status |= STA_SPIN;
	y -= defaultHeight-height;
	double_jump_flag=2;
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