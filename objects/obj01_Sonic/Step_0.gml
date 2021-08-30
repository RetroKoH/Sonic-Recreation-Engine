/// @description Routine Handling

if fading exit;

switch(routine)
{
	case 0: // INIT
	{
		routine++;
		height=$13;
		width=9;
	} break;

	case 1: // Sonic_Control
	{
		switch(status&6) // Sonic's Control Modes based on status
		{
			case 0: // Normal (Ground)
				scr_sonic_jump();	// Check for starting a jump.
				if !jump
				{
					if gsp!=0 gsp-=(.125*sin(degtorad(angle)));	// Adjust Ground Speed based on current angle
					scr_sonic_move();							// Update gsp based on directional input and apply friction/deceleration.
					scr_sonic_roll();							// Check for starting a roll
					scr_sonic_level_bound();					// Keep Sonic inside the view and kill Sonic if he touches the kill plane
					x+=xsp; y+=ysp;								// SpeedtoPos
					scr_sonic_angle_pos();						// Floor collision and angle check occurs
				}
			break;
			case 2: // In-air
				// Check for jump button release (variable jump velocity).
				// Check for double jump abilities / turning Super
				scr_sonic_move_air();			// Air movement (xsp) & air drag
				scr_sonic_level_bound();		// Keep Sonic inside the view and kill Sonic if he touches the kill plane
				x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
				if (status&$40) ysp-=.15625;	// Underwater gravity
				angle = 0;						// Reset angle
				scr_sonic_check_floor();		// Floor sensor collision check (and walls)
			break;
			case 4: // Roll
				scr_sonic_jump();	// Check for starting a jump.
				if !jump
				{
					{		//SonicRollRepel
							var a = sin(degtorad(angle));
					        if sign(gsp)==sign(a)	gsp-=.078125*a;	// Rolling uphill
					        else					gsp-=.3125*a;	// Rolling downhill
					}
					scr_sonic_roll_speed();					// Update gsp and apply friction.
					scr_sonic_level_bound();				// Keep Sonic inside the view and kill Sonic if he touches the kill plane
					x+=xsp; y+=ysp;							// SpeedtoPos
					scr_sonic_angle_pos();					// Floor collision and angle check occurs
				}
			break;
			case 6: // Jump, roll jump, or in air while rolling
				// Check for jump button release (variable jump velocity).
				// Check for double jump abilities / turning Super
				scr_sonic_move_air();			// Air movement (xsp) & air drag
				scr_sonic_level_bound();		// Keep Sonic inside the view and kill Sonic if he touches the kill plane
				x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
				if (status&$40) ysp-=.15625;	// Underwater gravity
				angle = 0;						// Reset angle
				scr_sonic_check_floor();		// Floor sensor collision check (and walls)
			break;
		}
		scr_sonic_display();
		scr_touch_response();
	} break;

	case 2: // Sonic_Hurt
		x+=xsp; y+=ysp;	// SpeedToPos
		// Apply gravity
		if (status&STA_WATER)	ysp += .0625;
		else					ysp += .1875;
		// HurtStop
		scr_sonic_check_floor();
		if !(status&STA_INAIR)
		{
			xsp = 0;
			ysp = 0;
			gsp = 0;
			anim_ID = anim_player.walk;
			routine--;
		}
		scr_sonic_level_bound();		// Keep Sonic inside the view and kill Sonic if he touches the kill plane
	break;
	
	case 3: // Sonic_Death
		x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
	break;
}