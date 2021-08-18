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
			case 0:
				if gsp!=0 gsp-=(.125*sin(degtorad(angle)));	// Adjust Ground Speed based on current angle
				scr_sonic_move();							// Update gsp based on directional input and apply friction/deceleration.
				scr_sonic_roll();							// Check for starting a roll
				scr_sonic_level_bound();
				x+=xsp; y+=ysp;
				scr_sonic_angle_pos();
			break;
			case 2:
			break;
			case 4:
				scr_sonic_rollspeed();
				scr_sonic_level_bound();
				x+=xsp; y+=ysp;
			break;
			case 6:
			break;
		}
	}
}