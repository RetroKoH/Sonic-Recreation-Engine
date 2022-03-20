/// @description Routine Handling

if fading exit;

// Reset sensor flags
col_sensor_A = false;
col_sensor_B = false;
col_sensor_C = false;
col_sensor_D = false;
col_sensor_E = false;
col_sensor_F = false;

switch(routine)
{
	case 0: // INIT
	{
		routine++;
		defaultHeight=$13;
		height=defaultHeight;
		width=9;
	} break;

	case 1: // Sonic_Control
	{
		switch(status&6) // Sonic's Control Modes based on status
		{
			case 0: // Normal (Not in ball, not in air)
				scr_player_jump();	// Check for starting a jump.
				if !jump
				{
					scr_player_slope_resist(false);	// Adjust Ground Speed based on current angle
					scr_player_move();				// Update gsp based on directional input and apply friction/deceleration.
					scr_player_roll();				// Check for starting a roll
					scr_player_level_bound();		// Interactions with camera planes
					scr_apply_speed(false);			// SpeedtoPos
					scr_player_angle_pos();			// Floor collision and angle check occurs
					scr_player_slope_repel();		// Push player down slopes, and fall from loops (comment out for testing slopes)
				}
			break;
			case 2: // In-air (Not in ball, in air)
				scr_player_jump_height();		// Mostly unused here. Air velocity gets capped here.
				scr_player_move_air();			// Air movement (xsp) & air drag
				scr_player_level_bound();		// Interactions with camera planes
				scr_apply_speed(true);			// ObjectFall
				if (status&$40) ysp-=.15625;	// Underwater gravity
				scr_player_jump_angle(angle);	// Reset angle
				scr_player_check_floor();		// Floor sensor collision check (and walls)
			break;
			case 4: // Rolling (in ball, not in air)
				scr_player_jump();	// Check for starting a jump.
				if !jump
				{
					scr_player_slope_resist(true);	// Adjust Ground Speed based on current angle
					scr_player_roll_speed();		// Update gsp and apply friction.
					scr_player_level_bound();		// Interactions with camera planes
					scr_apply_speed(false);			// SpeedtoPos
					scr_player_angle_pos();			// Floor collision and angle check occurs
					scr_player_slope_repel();		// Push player down slopes, and fall from loops (comment out for testing slopes)
				}
			break;
			case 6: // (In ball, In air)
				scr_player_jump_height();		// Check jump height and cap air velocity
				scr_player_move_air();			// Air movement (xsp) & air drag
				scr_player_level_bound();		// Interactions with camera planes
				scr_apply_speed(true);			// ObjectFall
				if (status&$40) ysp-=.15625;	// Underwater gravity
				scr_player_jump_angle(angle);	// Reset angle
				scr_player_check_floor();		// Floor sensor collision check (and walls)
			break;
		}
		scr_player_display();
		scr_touch_response();
	} break;

	case 2: // Sonic_Hurt
		scr_apply_speed(false);
		ysp += (status&STA_WATER) ? .0625 : .1875; // Apply gravity (Slightly different in this state)
		scr_player_hurt_stop();
		scr_player_level_bound();		// Keep Sonic inside the view and kill Sonic if he touches the kill plane
	break;
	
	case 3: // Sonic_Death
		scr_apply_speed(true);			// ObjectFall
	break;
}

// Handle move_angle
if xsp == 0 && ysp == 0
	move_angle = 0
else
	move_angle = scr_wrap_angle(point_direction(x,y,x+xsp,y+ysp)+90);