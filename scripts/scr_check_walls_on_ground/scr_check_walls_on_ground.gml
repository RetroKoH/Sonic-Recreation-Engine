function scr_check_walls_on_ground()
{
	// Handles collisions with walls based on quadrant of the ground angle
	var dist, quadrant = scr_get_quadrant(angle);
	
	if (gsp != 0 && (angle < 90 || angle >= 270))
	{
		var quadCheck;
		// Get distance from wall
		if (gsp > 0)
		{
			quadCheck = (quadrant + 1) & 3;
			dist = scr_get_right_wall_dist(10, (angle == 0) ? 8 : 0, quadrant);
		}
		else if (gsp < 0)
		{
			quadCheck = (quadrant - 1) & 3;
			dist = scr_get_left_wall_dist(10, (angle == 0) ? 8 : 0, quadrant);
		}

		if (dist < 0)
		{
			switch (quadCheck)
			{
				// Running downwards
				case 0:
					ysp += dist;
				break;
				// Running left
				case 1:
					xsp -= dist;
					status |= STA_PUSH;
					gsp = 0;
				break;
				// Running upwards
				case 2:
					ysp -= dist;
				break;
				// Running right
				case 3:
					xsp += dist;
					status |= STA_PUSH;
					gsp = 0;
				break;
			}
		}
	}
}