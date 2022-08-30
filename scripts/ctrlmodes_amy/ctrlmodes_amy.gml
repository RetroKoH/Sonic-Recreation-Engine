function CTRLModes_Amy(){
	switch(status&6) // Amy's Control Modes based on status
	{
		case 0: // Normal (Not in ball, not in air)
			CTRL_Amy_Normal();
		break;
		case 2: // In-air (Not in ball, in air)
			CTRL_Amy_InAir();
		break;
		case 4: // Rolling (in ball, not in air)
			CTRL_Amy_Roll();
		break;
		case 6: // (In ball, In air)
			CTRL_Amy_RollInAir();
		break;
	}
}

function CTRL_Amy_Normal(){
	ctrl = true;
	scr_sonic_peelout();				// *** Check for starting a running dash (Amy effectively uses a peelout)
	//if ctrl scr_amy_hammerjump();		// Check this before the actual jump script, as she can use this running or stationary via Down+Jump
	if ctrl scr_player_jump();			// Check for starting a jump.
	if ctrl {
		scr_player_slope_resist(false);	// Adjust Ground Speed based on current angle
		scr_player_move();				// Update gsp based on directional input and apply friction/deceleration.
		scr_player_roll();				// Check for starting a roll
		scr_player_level_bound();		// Interactions with camera planes
		scr_apply_speed(false);			// SpeedtoPos
		scr_player_angle_pos();			// Floor collision and angle check occurs
		scr_player_slope_repel();		// Push player down slopes, and fall from loops (comment out for testing slopes)
	}
}
function CTRL_Amy_InAir(){
	ctrl = true;
	if (double_jump_flag==1) scr_amy_hammerhover();	// Run a separate mode for the hammer hover
	else {
		if ysp<-15.75 ysp=-15.75;		// Cap upward mobility when NOT jumping. (no longer using Jump Height script)
		scr_player_move_air();			// Air movement (xsp) & air drag
		scr_player_level_bound();		// Interactions with camera planes
		scr_apply_speed(true);			// ObjectFall
		if (status&$40) ysp-=.15625;	// Underwater gravity (Integrate with ObjectFall)
		scr_player_jump_angle(angle);	// Reset angle
		scr_player_check_floor();		// Floor sensor collision check (and walls)
	}
}
function CTRL_Amy_Roll(){
	ctrl = true;
	scr_player_jump();					// Check for starting a jump.
	if ctrl {
		scr_player_slope_resist(true);	// Adjust Ground Speed based on current angle
		scr_player_roll_speed();		// Update gsp and apply friction.
		scr_player_level_bound();		// Interactions with camera planes
		scr_apply_speed(false);			// SpeedtoPos
		scr_player_angle_pos();			// Floor collision and angle check occurs
		scr_player_slope_repel();		// Push player down slopes, and fall from loops (comment out for testing slopes)
	}
}
function CTRL_Amy_RollInAir(){
	ctrl = true;
	if (double_jump_flag==1) scr_amy_hammerhover();	// Run a separate mode for the hammer hover
	else {
		scr_player_jump_height();		// Check jump height and cap air velocity
		scr_player_move_air();			// Air movement (xsp) & air drag
		scr_player_level_bound();		// Interactions with camera planes
		scr_apply_speed(true);			// ObjectFall
		if (status&$40) ysp-=.15625;	// Underwater gravity (Integrate with ObjectFall)
		scr_player_jump_angle(angle);	// Reset angle
		scr_player_check_floor();		// Floor sensor collision check (and walls)
	}
}