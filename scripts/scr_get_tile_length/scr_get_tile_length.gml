function scr_get_tile_length(tile, s_x, s_y, quadrant){
	var length;
	
	switch (quadrant)
	{
		default:
		case 2:
			length = scr_tile_get_height(tile, s_x) * ((quadrant > 1) ? -1 : 1);
			break;
		case 1:
		case 3:
			length = scr_tile_get_width(tile, s_y) * ((quadrant > 1) ? -1 : 1);
			break;
	}
	
	if (length == -TILE_SIZE)
		length = TILE_SIZE;
	return length;
}