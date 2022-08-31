// Needs proper S3K implementation (animation doesnt always reset)
function scr_player_acquirefloor(){
	switch(object_index){
		case obj01_Sonic: scr_sonic_acquirefloor(); break;
		case obj01_Tails: scr_others_acquirefloor(); break;
		case obj01_Knuckles: scr_others_acquirefloor(); break;
		case obj01_Amy: scr_others_acquirefloor(); break;
		case obj01_Mighty: scr_mighty_acquirefloor(); break;
		case obj01_Ray: scr_others_acquirefloor(); break;
		case obj01_Metal: scr_others_acquirefloor(); break;
	}
}

function scr_sonic_acquirefloor(){
	var h = height;			// Store current height
	height=defaultHeight;	// Reset collision box
	width=WIDTH_MAIN;
	if (status&STA_SPIN)	// If Sonic is spinning
	{
		status^=STA_SPIN;			// Clear spin status
		anim_ID=anim_player.walk;
		y-=defaultHeight-h;			// Pop y-pos out using stored height
	}
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
	jump=false;
	itembonus=0;			// Clear chain bonus counter
	
	// Double jump handling
	if (double_jump_flag) {
		if (powerups&POW_BUBBLE) scr_bubble_bounce();
		else if !(powerups&POW_CHKELSHLDS) {
			if double_jump_property >= 20
				scr_drop_dash();
		}
		double_jump_flag=false;
		double_jump_property=0;
	}
}

function scr_mighty_acquirefloor(){
	var h = height;			// Store current height
	height=defaultHeight;	// Reset collision box
	width=WIDTH_MAIN;
	if (status&STA_SPIN)	// If Sonic is spinning
	{
		status^=STA_SPIN;			// Clear spin status
		anim_ID=anim_player.walk;
		y-=defaultHeight-h;			// Pop y-pos out using stored height
	}
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
	jump=false;
	itembonus=0;			// Clear chain bonus counter
	
	// Double jump handling
	if (double_jump_flag==1)
		scr_drilldive_rebound();
	else if (double_jump_flag==2) {
		double_jump_flag=false;
		double_jump_property=0;
	}
}

function scr_others_acquirefloor(){
	var h = height;			// Store current height
	height=defaultHeight;	// Reset collision box
	width=WIDTH_MAIN;
	if (status&STA_SPIN)	// If Sonic is spinning
	{
		status^=STA_SPIN;			// Clear spin status
		anim_ID=anim_player.walk;
		y-=defaultHeight-h;			// Pop y-pos out using stored height
	}
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
	jump=false;
	itembonus=0;			// Clear chain bonus counter
	double_jump_flag=false;
	double_jump_property=0;
}

// Needs to be tested further
function scr_bubble_bounce(){
	var bounce = !(status&STA_WATER) ? 7.5 : 4;
	xsp = (gsp * cos(degtorad(angle)) - bounce * sin(degtorad(angle)));
	ysp = (gsp * sin(degtorad(angle)) - bounce * cos(degtorad(angle)));
	//xsp -= bounce * sin(degtorad(angle));
	//ysp -= bounce * cos(degtorad(angle));
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
	audio_play_sound(sfx_ShieldBubbleBounce,1,false);
}

function scr_drop_dash(){
	status|=STA_SPIN;
	height=HEIGHT_ROLL;
	width=WIDTH_ROLL;
	anim_ID=anim_player.roll;
	if audio_is_playing(sfx_DropDash)
					audio_stop_sound(sfx_DropDash);
	audio_play_sound(sfx_DropDashRelease,1,false);
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

// Needs to be fixed
function scr_drilldive_rebound(){
	var bounce = !(status&STA_WATER) ? 2 : 1;
	var gvel = gsp - (gsp>>2)
	xsp = (gvel * cos(degtorad(angle)) - bounce * sin(degtorad(angle)));
	ysp = (gvel * sin(degtorad(angle)) - bounce * cos(degtorad(angle)));
	//xsp -= bounce * sin(angle);
	//ysp -= bounce * cos(angle);
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
	double_jump_flag=2; // We don't want him to spam this
	audio_play_sound(sfx_MightyLand,1,false);
}