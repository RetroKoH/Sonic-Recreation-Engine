function scr_check_walls_on_ground(){
	// CheckWallsOnGround - This allows us to detect walls, and push them away.
	if !(angle>90 && angle<270)
	{
		var pos, tile;
	    if gsp>0
		{
			pos = x+11+xsp;
			tile = scr_find_nearest_tile(map_id,pos,y+8); // CalcRoomInFront
			if tile {
				xsp=(scr_tile_get_coord(pos)-(x+11));
				status|=$20; // Set pushing status bit
				gsp=0;
			}
		}
	    else if gsp<0
		{
			pos = x-10+xsp;
			tile = scr_find_nearest_tile(map_id,pos,y+8); // CalcRoomInFront
			if tile {
				xsp=((scr_tile_get_coord(pos)+TILE_SIZE)-(x-10));
				status|=$20; // Set pushing status bit
				gsp=0;
			}
		}
	}
}