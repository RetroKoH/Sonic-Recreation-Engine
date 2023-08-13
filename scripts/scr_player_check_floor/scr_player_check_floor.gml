// Sonic_Floor()
function scr_player_check_floor(){
	// Get quadrant
	var floor_dist, wall_dist, ceil_dist;
	
	// For some reason, certain tiles don't cooperate (flipped and mirrored)
	// Handle collision based on quadrant of movement
	
	// Get movement angle quadrant
	if abs(xsp) >= abs(ysp)
	{
		var MoveDirection = xsp > 0 ? 1 : 3;
	}
	else
	{
		var MoveDirection = ysp > 0 ? 0 : 2;
	}
	switch MoveDirection
	//switch(floor(scr_wrap_angle(scr_wrap_angle(point_direction(x,y,x+xsp,y+ysp)+90) + 45) / 90))
	{
		case 0: // Mostly downward
		{
			// Check left wall collision (Wall Sensor E)
			wall_dist = scr_player_get_left_wall_dist(0);
			if (wall_dist < 0)
			{
				x -= wall_dist;
				xsp = 0; // stop Sonic since he hit a wall
			}
			
			// Check right wall collision (Wall Sensor F)
			wall_dist = scr_player_get_right_wall_dist(0);
			if (wall_dist < 0)
			{
				x += wall_dist;
				xsp = 0; // stop Sonic since he hit a wall
			}

			// Check floor collision (Floor Sensors A/B)
			floor_dist = scr_player_get_floor_dist(0);
			if (floor_dist < 0)
			{
				// Only hit the floor if we aren't too deep into it
				// (Allows us to fall through top solid blocks if we haven't quite cleared them)
				var dist_chk = -(ysp + 8);
				if ((floor_dist >= dist_chk || col_other_dist >= dist_chk)) // && (!IS_LRB_SOLID(col_tile))
				{
					y += floor_dist;
					angle = col_angle;
					
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
					scr_player_acquirefloor();
				}
			}
		}
		break;
		case 1: // Mostly right
		{
			// Check right wall collision
			wall_dist = scr_player_get_right_wall_dist(0);
			if (wall_dist < 0)
			{
				x += wall_dist;
				xsp = 0;
				gsp = ysp;
			}
			
			else {
				// Check ceiling collision
				ceil_dist = scr_player_get_ceiling_dist(0);
				if (ceil_dist < 0)
				{
					if (ceil_dist > -20) {
						// Only hit the ceiling if we aren't too deep into it
						y -= ceil_dist;
						if (ysp < 0) ysp = 0;
					}
					else {
						// Check left wall collision
						wall_dist = scr_player_get_left_wall_dist(0);
						if (wall_dist < 0)
						{
							x -= wall_dist;
							xsp = 0;
						}
					}
				}
				else if (ysp >= 0)
				{
					// Check floor collision
					floor_dist = scr_player_get_floor_dist(0);
					if (floor_dist < 0)
					{
						y += floor_dist;
						angle = col_angle;
						ysp = 0;
						gsp = xsp;
						scr_player_acquirefloor();
					}
				}
			}
		}
		break;
		case 2: // Mostly upward
		{
			// Check left wall collision
			wall_dist = scr_player_get_left_wall_dist(0);
			if (wall_dist < 0)
			{
				x -= wall_dist;
				xsp = 0;
			}
			
			// Check right wall collision
			wall_dist = scr_player_get_right_wall_dist(0);
			if (wall_dist < 0)
			{
				x += wall_dist;
				xsp = 0;
			}

			// Check ceiling collision
			ceil_dist = scr_player_get_ceiling_dist(0);
			if (ceil_dist < 0)
			{
				show_message("Ceiling Distance: "+string(ceil_dist)+"/n"+
							"Tile Angle: "+string(col_angle));
				y -= ceil_dist;
				
				if (col_angle != 0 && (col_angle > 225 || col_angle <= 135))
				{
					// If the ceiling is steep, actually land on it
					angle = col_angle;
					gsp = (col_angle < 180) ? -ysp : ysp
					scr_player_acquirefloor();
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
			wall_dist = scr_player_get_left_wall_dist(0);
			if (wall_dist < 0)
			{
				x -= wall_dist;
				xsp = 0;
				gsp = ysp;
			}
			
			else {
				// Check ceiling collision
				ceil_dist = scr_player_get_ceiling_dist(0);
				if (ceil_dist < 0)
				{
					if (ceil_dist > -20)
					{
						// Only hit the ceiling if we aren't too deep into it
						y -= ceil_dist;
						if (ysp < 0) ysp = 0;
					}
					else
					{
						// Check right wall collision
						wall_dist = scr_player_get_right_wall_dist(0);
						if (wall_dist < 0)
						{
							x += wall_dist;
							xsp = 0;
						}
					}
				}
				else if (ysp >= 0)
				{
					// Check floor collision
					floor_dist = scr_player_get_floor_dist(0);
					if (floor_dist < 0)
					{
						y += floor_dist;
						angle = col_angle;
						ysp = 0;
						gsp = xsp;
						scr_player_acquirefloor();
					}
				}
			}
		}
		break;
	}
}