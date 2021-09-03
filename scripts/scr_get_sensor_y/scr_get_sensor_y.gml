function scr_get_sensor_y(quadrant, x_offset, y_offset){
	switch (quadrant)
	{
		default:
			return floor(y) + y_offset;
		case 1:
			return floor(y) - x_offset;
		case 2:
			return (floor(y) - y_offset) ^ (TILE_SIZE - 1);
		case 3:
			return floor(y) + x_offset;
	}
}