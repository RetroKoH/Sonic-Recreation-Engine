function scr_check_walls_on_ground()
{
	// Handles collisions with walls based on quadrant of the ground angle
	var dist, angleCheck, sensorY, quadrant = scr_get_quadrant(angle);
	sensorY = (angle < 11.25 || angle > 348.75) ? 8 : 0;
	
	if (gsp != 0 && (angle < 90 || angle >= 270))
	{
		// Get distance from wall
		
		// If moving right, find walls to your right.
		if (gsp > 0)
		{
			angleCheck = angle - 90;
			dist = scr_player_get_right_wall_dist(quadrant);
		}
		
		// If moving left, find walls to your left.
		else if (gsp < 0)
		{
			angleCheck = angle + 90;
			dist = scr_player_get_left_wall_dist(quadrant);
		}

		if (dist < 0)
		{
			switch(floor(scr_wrap_angle(angleCheck + 45) / 90))
			{
				// Running downwards
				case 0:
					y += dist;
					ysp = 0;
					gsp = 0;		// Fixes wall grinding bug
				break;
				// Running left
				case 1:
					x -= dist;
					xsp = 0;
					status |= STA_PUSH;
					gsp = 0;
				break;
				// Running upwards
				case 2:
					y -= dist;
					ysp = 0;
					gsp = 0;		// Fixes wall grinding bug
				break;
				// Running right
				case 3:
					x += dist;
					xsp = 0;
					status |= STA_PUSH;
					gsp = 0;
				break;
			}
		}
	}
}