function scr_sonic_check_floor(){
	// Get quadrant
	var pos, tile, hgt, dist_l, dist_r, dist_real, angle_real, t_real, quadrant = scr_get_quadrant(move_angle);
	
	// Handle collision based on quadrant of movement
	switch(quadrant)
	{
		case 0: // Mostly downward
		{
			// First check for walls and stop xsp if we find them
			if xsp>0
			{
				col_sensor_E=false;
				pos = x+11+xsp;
				tile = scr_find_nearest_tile(map_id,pos,y); // CalcRoomInFront
				if tile {
					hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

					if (scr_tile_get_coord(y)+(TILE_SIZE - hgt) <= y) {
						x += (scr_tile_get_coord(pos)-(x+11));
						xsp = 0;
						col_sensor_F = true;
					} else col_sensor_F = false;
				}
			}
		    else if xsp<0
			{
				col_sensor_F=false;
				pos = x-10+xsp;
				tile = scr_find_nearest_tile(map_id,pos,y); // CalcRoomInFront
				if tile {
					hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

					if (scr_tile_get_coord(y)+(TILE_SIZE - hgt) <= y) {
						x += ((scr_tile_get_coord(pos)+TILE_SIZE)-(x-10));
						xsp = 0;
						col_sensor_E = true;
					} else col_sensor_E = false;
				}
			}

			// After, find floor
			// Get tile distances
			dist_l = scr_get_tile_dist(-width, height, 0);
			col_sensor_A = col_sensor;
			col_tile_A = col_tile;
			col_angle_A = col_angle;

			dist_r = scr_get_tile_dist(width, height, 0);
			col_sensor_B = col_sensor;
			col_tile_B = col_tile;
			col_angle_B = col_angle;
		
			// Get shortest distance and set angle
	        if (dist_l < dist_r)
	        {
	            dist_real = dist_l;
	            angle_real = col_angle_A;
	            t_real = col_tile_A;
	        }
	        else
	        {
	            dist_real = dist_r;
	            angle_real = col_angle_B;
	            t_real = col_tile_B;
	        }
		
			// Only reattach to the floor if the "winning distance" is less than 0.
			if dist_real < 0
			{
	            angle = angle_real;
				y += dist_real;
				scr_sonic_acquirefloor();
			}
		}
		break;
		case 1: // Mostly right
		{
			// Check right wall sensor
			col_sensor_E=false;
			pos = x+11+xsp;
			tile = scr_find_nearest_tile(map_id,pos,y); // CalcRoomInFront
			if tile {
				hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

				if (scr_tile_get_coord(y)+(TILE_SIZE - hgt) <= y) {
					x += (scr_tile_get_coord(pos)-(x+11));
					xsp = 0;
					col_sensor_F = true;
				} else col_sensor_F = false;
			}

			// After, find floor
			// Get tile distances
			dist_l = scr_get_tile_dist(-width, height, 0);
			col_sensor_A = col_sensor;
			col_tile_A = col_tile;
			col_angle_A = col_angle;

			dist_r = scr_get_tile_dist(width, height, 0);
			col_sensor_B = col_sensor;
			col_tile_B = col_tile;
			col_angle_B = col_angle;
		
			// Get shortest distance and set angle
	        if (dist_l < dist_r)
	        {
	            dist_real = dist_l;
	            angle_real = col_angle_A;
	            t_real = col_tile_A;
	        }
	        else
	        {
	            dist_real = dist_r;
	            angle_real = col_angle_B;
	            t_real = col_tile_B;
	        }
		
			// Only reattach to the floor if the "winning distance" is less than 0.
			if dist_real < 0
			{
	            angle = angle_real;
				y += dist_real;
				scr_sonic_acquirefloor();
			}
		}
		break;
		case 2: // Mostly upward
		{
			// First check for walls and stop xsp if we find them
			if xsp>0
			{
				col_sensor_E=false;
				pos = x+11+xsp;
				tile = scr_find_nearest_tile(map_id,pos,y); // CalcRoomInFront
				if tile {
					hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

					if (scr_tile_get_coord(y)+(TILE_SIZE - hgt) <= y) {
						x += (scr_tile_get_coord(pos)-(x+11));
						xsp = 0;
						col_sensor_F = true;
					} else col_sensor_F = false;
				}
			}
		    else if xsp<0
			{
				col_sensor_F=false;
				pos = x-10+xsp;
				tile = scr_find_nearest_tile(map_id,pos,y); // CalcRoomInFront
				if tile {
					hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

					if (scr_tile_get_coord(y)+(TILE_SIZE - hgt) <= y) {
						x += ((scr_tile_get_coord(pos)+TILE_SIZE)-(x-10));
						xsp = 0;
						col_sensor_E = true;
					} else col_sensor_E = false;
				}
			}
		}
		break;
		case 3: // Mostly left
		{
			// Check left wall sensor
			col_sensor_F=false;
			pos = x-10+xsp;
			tile = scr_find_nearest_tile(map_id,pos,y); // CalcRoomInFront
			if tile {
				hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

				if (scr_tile_get_coord(y)+(TILE_SIZE - hgt) <= y) {
					x += ((scr_tile_get_coord(pos)+TILE_SIZE)-(x-10));
					xsp = 0;
					col_sensor_E = true;
				} else col_sensor_E = false;
			}

			// After, find floor
			// Get tile distances
			dist_l = scr_get_tile_dist(-width, height, 0);
			col_sensor_A = col_sensor;
			col_tile_A = col_tile;
			col_angle_A = col_angle;

			dist_r = scr_get_tile_dist(width, height, 0);
			col_sensor_B = col_sensor;
			col_tile_B = col_tile;
			col_angle_B = col_angle;

			// Get shortest distance and set angle
	        if (dist_l < dist_r)
	        {
	            dist_real = dist_l;
	            angle_real = col_angle_A;
	            t_real = col_tile_A;
	        }
	        else
	        {
	            dist_real = dist_r;
	            angle_real = col_angle_B;
	            t_real = col_tile_B;
	        }
		
			// Only reattach to the floor if the "winning distance" is less than 0.
			if dist_real < 0
			{
	            angle = angle_real;
				y += dist_real;
				scr_sonic_acquirefloor();
			}
		}
		break;
	}
}