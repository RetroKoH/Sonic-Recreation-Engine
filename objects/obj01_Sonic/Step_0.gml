/// @description Sonic's Routines

if fading exit;

switch(routine)
{
	case 0: // INIT
	{
		routine+=2;
		height=$13;
		width=9;
	} break;

	case 2: // Sonic_Control
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
				scr_sonic_check_floor();		// Floor sensor collision check
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
				scr_sonic_check_floor();		// Floor sensor collision check
			break;
		}
	}
}