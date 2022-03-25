function scr_topsolid_obj(width, height){
	if (status&STA_ONOBJ)
	{
		var combined_x_radius = (floor(bbox_right-bbox_left) div 2)+player.width+1;
		var x_comp = (player.x - x) + combined_x_radius; //get the position difference     WAS: (x + (floor(bbox_right-bbox_left) div 2) - player.x);
		if(player.status&STA_INAIR || x_comp < 0 || x_comp >= combined_x_radius*2)
		{
			scr_solid_exit_platform();
			return 0;
		}
	}
	else return scr_topsolid_obj_collide(width, height);
}

// Top-Solid platform object collision
function scr_topsolid_obj_collide(width, height){
	var overlap = false;
	var _px = player.x, _py = player.y;
	var left_diff = (_px - x) + width;
	
	if ((player.ysp >= 0) && (left_diff >= 0) && (left_diff <= width*2)) // if (left_diff < 0) = too far to the left; (left_diff > combined_x_radius*2) = too far to the right
	{	// We are overlapping on the x axis, check y axis
		var top_diff = (_py - y) + 4 + height;
		if ((top_diff >= 0) && (top_diff <= height*2)) overlap=true; // if (top_diff < 0) = too far above; if (top_diff > combined_y_radius*2) = too far below
	}
	
	if overlap{
		// Collide vertically
		if (top_diff <= 0)
		{
			// Check for landing on object
			if (top_diff >= -16)
			{
				var x_comp = x + (width div 2) - _px;
				if ((x_comp >= 0 && x_comp < width) && player.ysp >= 0)
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
					return 1; //Set top touch flag
				}
			}
			return 0;
		}
	}
}

/*{
	if (status&STA_ONOBJ)
	{
		var combined_x_radius = (floor(bbox_right-bbox_left) div 2)+player.width+1;
		var x_comp = (player.x - x) + combined_x_radius; //get the position difference     WAS: (x + (floor(bbox_right-bbox_left) div 2) - player.x);
		if(player.status&STA_INAIR || x_comp < 0 || x_comp >= combined_x_radius*2)
		{
			scr_solid_exit_platform();
			return 0;
		}
		else
		{
			scr_solid_move_player(player);
			return 1;
		}
	}
	else return scr_solid_obj_collide();
}

// Move player with the object (Will only apply to moving solids)
function scr_solid_move_player(p){
	if (p.routine>2) exit; // Don't collide if in death
	
	p.y = bbox_top-p.height;
	p.x -= (prev_x - x)
}

// Fall off the solid object (Feels slightly wonky, but it works)
function scr_solid_exit_platform(){
	player.status &= ~STA_ONOBJ;
	status &= ~STA_ONOBJ;
	player.status |= STA_INAIR;
}

// Solid object collision
function scr_solid_obj_collide(){
	var overlap = false;
	var _px = player.x, _py = player.y;
	var combined_x_radius = (floor(bbox_right-bbox_left) div 2)+player.width+1;
	var left_diff = (_px - x) + combined_x_radius;

	if ((left_diff >= 0) && (left_diff <= combined_x_radius*2)) // if (left_diff < 0) = too far to the left; (left_diff > combined_x_radius*2) = too far to the right
	{	// We are overlapping on the x axis, check y axis
		var combined_y_radius = (floor(bbox_bottom-bbox_top) div 2)+player.height;
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
					var x_comp = x + (floor(bbox_right-bbox_left) div 2) - _px;
					if ((x_comp >= 0 && x_comp < floor(bbox_right-bbox_left)) && player.ysp >= 0)
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
						return 1; //Set top touch flag
					}
				}
				return 0;
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
					return 1;
				}
				else
				{
					if !(player.status&STA_INAIR)
					{
						if abs(x_clip) >= 12 // Changed this from 16
						{
							with(player) scr_player_death();
							return 1;
						}
					}
					else return 1;
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
					return 1;
				}
			}
			// Mid-air or near edges, clear push flags
			status&=~STA_PUSH;
			player.status&=~STA_PUSH;
			return 1;
		}
	}
	return 0;
}