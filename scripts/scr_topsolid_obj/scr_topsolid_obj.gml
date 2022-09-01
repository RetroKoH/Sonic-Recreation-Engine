function scr_topsolid_obj(width,height,height_air,prev_x){
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
	else return scr_topsolid_obj_collide(width, height_air, prev_x);
}

// Needs to be fixed
function scr_topsolid_obj_slope(width, heightmap, prev_x){
	if (status&STA_ONOBJ)
	{
		var combined_x_radius = width+player.width+1;
		var x_comp = (player.x - x) + combined_x_radius; //get the position difference
		if(player.status&STA_INAIR || x_comp < 0 || x_comp >= combined_x_radius*2)
		{
			scr_solid_exit_platform();
			return 0; // Register no collision
		}
		else
		{
			// Slightly inaccurate (Required 20 extra bytes)
			var i = x_comp div 2;
			var height = heightmap[i];
			scr_solid_move_player(player, height, prev_x);
			return 1; // Register top collision
		}
	}
	else return scr_topsolid_obj_collide(width, 0, prev_x, heightmap);
}

// Top-Solid platform object collision
function scr_topsolid_obj_collide(width, height, prev_x, heightmap=-1){
	var overlap = false;
	var _px = player.x, _py = player.y;
	var combined_x_radius = width+player.width+1;
	var left_diff = (_px - x) + width;
	
	if ((player.ysp >= 0) && (left_diff >= 0) && (left_diff < combined_x_radius*2)) // if (left_diff < 0) = too far to the left; (left_diff > combined_x_radius*2) = too far to the right
	{	// We are overlapping on the x axis, check y axis
		// This part is Slightly inaccurate (Required 20 extra bytes)
		if (heightmap != -1) {
			var i = left_diff div 2;
			height = heightmap[i];
		}
		var combined_y_radius = height+player.height;
		var top_diff = (_py - y) + 4 + combined_y_radius;
		if ((top_diff >= 0) && (top_diff <= combined_y_radius*2)) overlap=true; // if (top_diff < 0) = too far above; if (top_diff > combined_y_radius*2) = too far below
	}
	
	if overlap && (player.routine < 3) {
		var y_dist;
		if (_py > y) // If player is on the bottom (negative value)
			y_dist = top_diff - 4 - combined_y_radius*2;
		else // If player is on the top (positive value)
			y_dist = top_diff;
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
					player.ysp = 0;
					player.gsp = player.xsp;
					with(player) scr_player_acquirefloor();
					player.platform_ID = self;
					player.status|=STA_ONOBJ;
					status|=STA_ONOBJ;
					return 1; // Register top collision
				}
			}
			return 0; // Register no collision
		}
	}
}