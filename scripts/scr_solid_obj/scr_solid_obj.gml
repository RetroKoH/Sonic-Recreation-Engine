function scr_solid_obj(width,height,height_air,prev_x){
	if (status&STA_ONOBJ)
	{
		var combined_x_radius = width+player.width+1;
		var x_comp = (player.x - x) + combined_x_radius; //get the position difference     WAS: (x + (floor(bbox_right-bbox_left) div 2) - player.x);
		if(player.status&STA_INAIR || x_comp < 0 || x_comp >= combined_x_radius*2)
		{
			scr_solid_exit_platform();
			return 0; // Register no collision
		}
		else
		{
			scr_solid_move_player(player, height, prev_x);
			return 1; // Register top collision
		}
	}
	else return scr_solid_obj_collide(width, height_air, prev_x);
}

// Move player with the object (Will only apply to moving solids)
function scr_solid_move_player(p, height, prev_x){
	if p.routine>2 exit; // Don't collide if in death
	
	var top = y - height - 1;
	p.y = top-p.height;
	p.x -= (prev_x - x)
}

// Fall off the solid object (Feels slightly wonky, but it works)
function scr_solid_exit_platform(){
	player.status &= ~STA_ONOBJ;
	status &= ~STA_ONOBJ;
	player.status |= STA_INAIR;
}

// Solid object collision
function scr_solid_obj_collide(width, height, prev_x){
	var overlap = false;
	var _px = player.x, _py = player.y;
	var combined_x_radius = width+player.width+1;
	var left_diff = (_px - x) + combined_x_radius;

	if ((left_diff >= 0) && (left_diff <= combined_x_radius*2)) // if (left_diff < 0) = too far to the left; (left_diff > combined_x_radius*2) = too far to the right
	{	// We are overlapping on the x axis, check y axis
		var combined_y_radius = height+player.height;
		var top_diff = (_py - y) + 4 + combined_y_radius;

		if ((top_diff >= 0) && (top_diff <= combined_y_radius*2)) overlap=true; // if (top_diff < 0) = too far above; if (top_diff > combined_y_radius*2) = too far below
	}

	// If overlap is true, both distances MUST be 0 or positive, and within the diameter
	if overlap && (player.routine < 3) { // 3 = Death routine
		var x_dist, y_dist;
		if (_px > x) // If player is to the right of object (negative value)
			x_dist = left_diff - combined_x_radius*2;
		else // If player is to the left of object (positive value)
			x_dist = left_diff;
		var x_clip = abs(x_dist);
		
		if (_py > y) // If player is on the bottom (negative value)
			y_dist = top_diff - 4 - combined_y_radius*2;
		else // If player is on the top (positive value)
			y_dist = top_diff;
		var y_clip = abs(y_dist);

		// ACTUAL COLLISION AND STOPPING
		if (x_clip > y_clip) // If our horizontal difference is greater than the vertical difference (we're above / below the object)
		{
			// Collide vertically
			if (y_dist >= 0)
			{
				// Check for landing on object
				if (y_dist < 16)
				{
					var x_comp = prev_x + width - _px;
					if ((x_comp >= 0 && x_comp < (width*2)) && player.ysp >= 0)
					{
						// Land on the object
						y_dist -= 4;	
						player.y -= (y_dist + 1);
						player.angle = 0;
						with(player) scr_player_acquirefloor();
						player.ysp = 0;
						player.gsp = player.xsp;
						player.platform_ID = self;
						player.status|=STA_ONOBJ;
						status|=STA_ONOBJ;
						return 1; // Register top collision
					}
				}
				return 0; // Register no collision
			}
			else
			{
				// Check for hitting the bottom
				if (player.ysp != 0)
				{
					if (player.ysp < 0 && y_dist < 0)
					{
						player.y -= y_dist;
						player.ysp = 0;
					}
					return 2; // Register bottom collision
				}
				else
				{
					if !(player.status&STA_INAIR)
					{
						if abs(x_clip) >= 12 // Changed this from 16
						{
							with(player) scr_player_death();
							return 2; // Register bottom collision
						}
					}
					else return 2; // Register bottom collision
				}
			}
		}
		//else Fallthrough
		{
			// Collide horizontally
			if (y_clip > 4)
			{
				// Stop speed going towards object
				if (x_dist > 0)
				{
					if (player.xsp > 0)
					{
						player.xsp=0;
						player.gsp=0;
					}
				}
				else if (x_dist < 0)
				{
					if (player.xsp < 0)
					{
						player.xsp=0;
						player.gsp=0;
					}
				}
				// Clip and change push flags
				player.x -= x_dist;
				// This part needs fixing
				if !(player.status&STA_INAIR)
				{
					status|=STA_PUSH;
					player.status|=STA_PUSH;
					return 3; // Register Side Collision
				}
			}
			// Mid-air or near edges, clear push flags
			status&=~STA_PUSH;
			player.status&=~STA_PUSH;
			return 3; // Register Side Collision
		}
	}
	return 0; // Register no collision
}