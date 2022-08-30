function scr_amy_hammerhover(){
	scr_amy_move_hover();			// Hover movement
	scr_player_level_bound();		// Interactions with camera planes
	scr_apply_speed(false);			// SpeedToPos
	scr_player_jump_angle(angle);	// Reset angle
	scr_player_check_floor();		// Floor sensor collision check (and walls)
}

function scr_amy_move_hover(){
	if !(global.k_abc_h) {
		double_jump_flag = -1;
		anim_ID = anim_player.fall;
		xsp*=0.75;
		height=defaultHeight;
		width=WIDTH_MAIN;
	}
	else {
		// Acceleration - If gliding straight, accel to a rate of 12 px/s.
		if (gsp < 12) {
			var spd=0.015625; if (gsp<8) spd*=2;	// Accelerate 2x at lower speed
			xsp+=spd; if (xsp>12) gsp=12;			// Cap glide speed at 12.
		}
		
		// Hover Gravity
		ysp += 0.0625;
	}
}