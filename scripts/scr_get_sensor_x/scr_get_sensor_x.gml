function scr_get_sensor_x(quadrant, x_offset, y_offset){
	switch (quadrant)
	{
		default:
			return floor(x) + x_offset;
		case 1:
			return floor(x) + y_offset;
		case 2:
			return floor(x) - x_offset;
		case 3:
			return (floor(x) - y_offset) ^ (TILE_SIZE - 1);
	}
}