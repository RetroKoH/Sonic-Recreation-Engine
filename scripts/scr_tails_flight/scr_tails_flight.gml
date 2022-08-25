function scr_tails_flight(){
	scr_tails_move_flight();		// Flight movement & air drag
	scr_player_move_air();			// Air movement (xsp) & air drag
	scr_player_level_bound();		// Interactions with camera planes
	scr_apply_speed(false);			// SpeedToPos
	scr_player_jump_angle(angle);	// Reset angle
	scr_player_check_floor();		// Floor sensor collision check (and walls)
}

function scr_tails_move_flight(){
	if (double_jump_property) double_jump_property--;	// Decrement timer
	// Flight Control

	// Tails_Fly_WaitforInput
	if (double_jump_flag==1) {
		if (global.k_abc_p) && (ysp >= -1) && (double_jump_property)
			double_jump_flag=2;		// Set to 2
		ysp += 0.03125;				// Flight Gravity
	}
	// Tails_FlyHeight
	else {
		if (ysp < -1) double_jump_flag--; // if Tails is faster than $100 upwards, stop ascending
		else {
			ysp -= 0.125;
			double_jump_flag++;
			if (double_jump_flag==$20) double_jump_flag=1; // if Tails reaches $20, he must stop ascending
		}
	}
	// Tails_FlyCamera
	/*if y < (v_limittop2 + 16) scr_tails_set_flight_anim();
	else if ysp>0 scr_tails_set_flight_anim();
	else ysp=0;*/
	scr_tails_set_flight_anim();
}