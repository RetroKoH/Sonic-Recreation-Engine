function scr_check_walls_on_ground(){
	// CheckWallsOnGround - This allows us to detect walls, and push them away.
	if !(angle>90 && angle<270)
	{
		var pos, tile, hgt; var _y = 0;
		if (angle == 0) _y = 8; // Add 8 to y-pos if at a perfect flat angle

	    if gsp>0
		{
			col_sensor_E=false;
			pos = x+11+xsp;
			tile = scr_find_nearest_tile(map_id,pos,y+_y); // CalcRoomInFront
			if tile {
				hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.

				if (TILE_SIZE - hgt <= _y) {
					xsp=(scr_tile_get_coord(pos)-(x+11));
					status|=$20; // Set pushing status bit
					gsp=0;
					col_sensor_F=true;
				}  else col_sensor_F=false;
			}
		}
	    else if gsp<0
		{
			col_sensor_F=false;
			pos = x-10+xsp;
			tile = scr_find_nearest_tile(map_id,pos,y+_y); // CalcRoomInFront
			if tile {
				hgt=ds_grid_get(col_normal,tile_get_index(tile),scr_tile_get_coord(pos)&(TILE_SIZE-1));	// Get tile's height array value.
				
				if (TILE_SIZE - hgt <= _y) {
					xsp=((scr_tile_get_coord(pos)+TILE_SIZE)-(x-10));
					status|=$20; // Set pushing status bit
					gsp=0;
					col_sensor_E=true;
				} else col_sensor_E=false;
			}
		}
	}
}