function scr_sonic_check_floor(){
	// Get quadrant
	var dist;
	
	// Handle collision based on quadrant of movement
	switch(floor(scr_wrap_angle(move_angle + 45) / 90))
	{
		case 0: // Mostly downward
		{
			// Check left wall collision
			dist = scr_sonic_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0;
			}
			
			// Check right wall collision
			dist = scr_sonic_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0;
			}

			// Check floor collision
			dist = scr_sonic_get_floor_dist(0);
			if (dist < 0)
			{
				// Only hit the floor if we aren't too deep into it
				// (Allows us to fall through top solid blocks if we haven't quite cleared them)
				var dist_chk = -(ysp + 8);
				if ((dist >= dist_chk || col_other_dist >= dist_chk)) // && (!IS_LRB_SOLID(col_tile))
				{
					angle = col_angle;
					y += dist;
					
					if (angle > 22.5 && angle <= 292.5)
					{
						if (angle > 45 && angle <= 315)
						{
							// Steep slope
							xsp = 0;
							if (ysp >= 15.5)
								ysp = 15.5;
						}
						else
						{
							// Shallow slope
							ysp /= 2;
						}
						
						scr_sonic_acquirefloor();
						gsp = ysp;
						if (angle < 180)
							gsp = -gsp;
					}
					else
					{
						// Flat floor
						ysp = 0;
						gsp = xsp;
						scr_sonic_acquirefloor();
					}
				}
			}
		}
		break;
		case 1: // Mostly right
		{
			// Check right wall collision
			dist = scr_sonic_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0;
				gsp = ysp;
			}
			
			// Check ceiling collision
			dist = scr_sonic_get_ceiling_dist(0);
			if (dist < 0)
			{
				if (dist > -20)
				{
					// Only hit the ceiling if we aren't too deep into it
					y -= dist;
					if (ysp < 0)
						ysp = 0;
				}
				else
				{
					// Check left wall collision
					dist = scr_sonic_get_left_wall_dist(0);
					if (dist < 0)
					{
						x -= dist;
						xsp = 0;
					}
				}
			}
			else if (ysp >= 0)
			{
				// Check floor collision
				dist = scr_sonic_get_floor_dist(0);
				if (dist < 0)
				{
					y += dist;
					angle = col_angle;
					ysp = 0;
					gsp = xsp;
					scr_sonic_acquirefloor();
				}
			}
		}
		break;
		case 2: // Mostly upward
		{
			// Check left wall collision
			dist = scr_sonic_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0;
			}
			
			// Check right wall collision
			dist = scr_sonic_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0;
			}

			// Check ceiling collision
			dist = scr_sonic_get_ceiling_dist(0);
			if (dist < 0)
			{
				y -= dist;
				
				if (col_angle != 0 && (col_angle >= 225 || col_angle < 135))
				{
					// If the ceiling is steep, actually land on it
					angle = col_angle;
					scr_sonic_acquirefloor();
					gsp = ysp;
					if (angle < 180)
						gsp = -gsp;
				}
				else
				{
					// If the ceiling is shallow, just hit it
					ysp = 0;
				}
			}
		}
		break;
		case 3: // Mostly left
		{
			// Check left collision
			dist = scr_sonic_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0;
				gsp = ysp;
			}
			
			// Check ceiling collision
			dist = scr_sonic_get_ceiling_dist(0);
			if (dist < 0)
			{
				if (dist > -20)
				{
					// Only hit the ceiling if we aren't too deep into it
					y -= dist;
					if (ysp < 0)
						ysp = 0;
				}
				else
				{
					// Check right wall collision
					dist = scr_sonic_get_right_wall_dist(0);
					if (dist < 0)
					{
						x += dist;
						xsp = 0;
					}
				}
			}
			else if (ysp >= 0)
			{
				// Check floor collision
				dist = scr_sonic_get_floor_dist(0);
				if (dist < 0)
				{
					y += dist;
					angle = col_angle;
					ysp = 0;
					gsp = xsp;
					scr_sonic_acquirefloor();
				}
			}
		}
		break;
	}
}