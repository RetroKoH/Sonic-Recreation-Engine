// Knuckles uses this when gliding. Otherwise, uses standard check_floor
function scr_knux_check_floor_special(){
	// Get quadrant
	var dist;
	
	// For some reason, certain tiles don't cooperate (flipped and mirrored)
	// Handle collision based on quadrant of movement
	switch(floor(scr_wrap_angle(scr_wrap_angle(point_direction(x,y,x+xsp,y+ysp)+90) + 45) / 90))
	{
		case 0: // Mostly downward (Should be finished)
		{
			// Check left wall collision (Wall Sensor E)
			dist = scr_player_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0; // stop Sonic since he hit a wall
				glide_collision_prop|=STA_PUSH;
			}
			
			// Check right wall collision (Wall Sensor F)
			dist = scr_player_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0; // stop Sonic since he hit a wall
				glide_collision_prop|=STA_PUSH;
			}

			// Check floor collision (Floor Sensors A/B)
			dist = scr_player_get_floor_dist(0);
			if (dist < 0)
			{
				// Only hit the floor if we aren't too deep into it
				// (Allows us to fall through top solid blocks if we haven't quite cleared them)
				var dist_chk = -(ysp + 8);
				if ((dist >= dist_chk || col_other_dist >= dist_chk)) // && (!IS_LRB_SOLID(col_tile))
				{
					y += dist;
					angle = col_angle;
					ysp = 0;
					glide_collision_prop&=~STA_INAIR;
				}
			}
		}
		break;
		case 1: // Mostly right
		{
			// Check right wall collision
			dist = scr_player_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0;
				glide_collision_prop|=STA_PUSH; // gsp not set here
			}
			
			// Check ceiling collision
			dist = scr_player_get_ceiling_dist(0);
			if (dist < 0)
			{
				if (dist > -20)
				{
					// Only hit the ceiling if we aren't too deep into it
					y -= dist;
					if (ysp < 0) ysp = 0;
				}
				else
				{
					// Check left wall collision
					dist = scr_player_get_left_wall_dist(0);
					if (dist < 0)
					{
						x -= dist;
						xsp = 0;
						glide_collision_prop|=STA_PUSH;
					}
				}
			}
			else if (ysp >= 0)
			{
				// Check floor collision
				dist = scr_player_get_floor_dist(0);
				if (dist < 0)
				{
					y += dist;
					angle = col_angle;
					ysp = 0;
					glide_collision_prop&=~STA_INAIR;
				}
			}
		}
		break;
		case 2: // Mostly upward
		{
			// Check left wall collision
			dist = scr_player_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0;
				glide_collision_prop|=STA_PUSH;
			}
			
			// Check right wall collision
			dist = scr_player_get_right_wall_dist(0);
			if (dist < 0)
			{
				x += dist;
				xsp = 0;
				glide_collision_prop|=STA_PUSH;
			}

			// Check ceiling collision
			dist = scr_player_get_ceiling_dist(0);
			if (dist < 0)
			{
				y -= dist;
				ysp = 0; // If the ceiling is shallow, just hit it
			}
		}
		break;
		case 3: // Mostly left
		{
			// Check left collision
			dist = scr_player_get_left_wall_dist(0);
			if (dist < 0)
			{
				x -= dist;
				xsp = 0;
				glide_collision_prop|=STA_PUSH; // gsp not set here
			}
			
			// Check ceiling collision
			dist = scr_player_get_ceiling_dist(0);
			if (dist < 0)
			{
				if (dist > -20)
				{
					// Only hit the ceiling if we aren't too deep into it
					y -= dist;
					if (ysp < 0) ysp = 0;
				}
				else
				{
					// Check right wall collision
					dist = scr_player_get_right_wall_dist(0);
					if (dist < 0)
					{
						x += dist;
						xsp = 0;
						glide_collision_prop|=STA_PUSH;
					}
				}
			}
			else if (ysp >= 0)
			{
				// Check floor collision
				dist = scr_player_get_floor_dist(0);
				if (dist < 0)
				{
					y += dist;
					angle = col_angle;
					ysp = 0;
					glide_collision_prop&=~STA_INAIR;
				}
			}
		}
		break;
	}
}