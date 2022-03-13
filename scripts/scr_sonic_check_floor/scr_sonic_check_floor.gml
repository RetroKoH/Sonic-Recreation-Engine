// Sonic_Floor()
function scr_sonic_check_floor(){
	// Get quadrant
	var dist;
	
	// Handle collision based on quadrant of movement
	switch(floor(scr_wrap_angle(move_angle + 45) / 90))
	{
		case 0: // Mostly downward
		{
			// Check left wall collision (Wall Sensor E)
			dist = scr_sonic_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0; // stop Sonic since he hit a wall
			}
			
			// Check right wall collision (Wall Sensor F)
			dist = scr_sonic_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0; // stop Sonic since he hit a wall
			}

			// Check floor collision (Floor Sensors A/B)
			dist = scr_sonic_get_floor_dist(0);
			if (dist < 0)
			{
				// Only hit the floor if we aren't too deep into it
				// (Allows us to fall through top solid blocks if we haven't quite cleared them)
				var dist_chk = -(ysp + 8);
				if ((dist >= dist_chk || col_other_dist >= dist_chk)) // && (!IS_LRB_SOLID(col_tile))
				{
					y += dist;
					angle = col_angle;
					scr_sonic_acquirefloor();
					
					if (col_angle > 22.5 && col_angle <= 337.5)
					{
						if (col_angle > 45 && col_angle <= 315)
						{
							// Steep slope (If floor is greater than 45 degrees, use full vertical velocity (capped at 15.5))
							xsp = 0;
							if (ysp >= 15.5) ysp = 15.5;
						}
						else
						{
							// Shallow slope (If floor is greater than 22.5 degrees, use halved vertical velocity)
							ysp /= 2;
						}
						gsp = (col_angle < 180) ? -ysp : ysp
					}
					else
					{
						// Flat floor
						ysp = 0;
						gsp = xsp; // If floor is less than 22.5 degrees, use horizontal velocity
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