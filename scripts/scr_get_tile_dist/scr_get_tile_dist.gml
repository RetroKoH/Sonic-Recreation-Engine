function scr_sonic_get_tile_dist(sensor, quadrant){
    // Subroutine to find the distance from the floor/ceiling as he walks along the floor
    
	var s_x, s_y, s_pos, size_mask, tile, t_angle, t_length;
 
    // Get tile size mask
    size_mask = TILE_SIZE - 1
 
    // Get sensor position and reset flags
    if (sensor == 0)
    {
        col_sensor_A = false;
		s_x = scr_get_sensor_x(quadrant, -width, height);
		s_y = scr_get_sensor_y(quadrant, -width, height);
    }
    else
    {
        col_sensor_B = false;
		s_x = scr_get_sensor_x(quadrant, width, height);
		s_y = scr_get_sensor_y(quadrant, width, height);
    }
	
	// Choose which axis to use
	s_pos = s_y;
	if ((quadrant & 1) == 1)
		s_pos = s_x;
 
    // Get tile
    tile = scr_find_nearest_tile(map_id, s_x, s_y);
    if (!tile)
        return scr_sonic_get_tile_dist_adj(sensor, quadrant, 1) + TILE_SIZE;
		
    t_angle = scr_tile_get_angle(tile);
    t_length = scr_get_tile_length(tile, s_x, s_y, quadrant);
 
    // Set sensor flags
    if (sensor == 0)
    {
        col_sensor_A = true;
        col_tile_A = tile;
        col_angle_A = t_angle;
    }
    else
    {
        col_sensor_B = true;
        col_tile_B = tile;
        col_angle_B = t_angle;
    }
 
    // Check length
    if (t_length == 0)
    {
        // 0 length
        return scr_sonic_get_tile_dist_adj(sensor, quadrant, 1) + TILE_SIZE;
    }
    else if (t_length < 0)
    {
        // Negative length
        if (t_length + (s_pos & size_mask) >= 0)
            return scr_sonic_get_tile_dist_adj(sensor, quadrant, 1) + TILE_SIZE;
        else
            return scr_sonic_get_tile_dist_adj(sensor, quadrant, -1) - TILE_SIZE;
    }
    else if (t_length == TILE_SIZE)
    {
        // Max length
        return scr_sonic_get_tile_dist_adj(sensor, quadrant, -1) - TILE_SIZE;
    }
 
    // Normal length
    return size_mask - (t_length + (s_pos & size_mask));
}
 
function scr_sonic_get_tile_dist_adj(sensor, quadrant, adj_dir){
    // Continued checking for distance from the floor/ceiling if needed
 
    var s_x, s_y, s_pos, size_mask, tile, t_angle, t_length, neg_dist;
 
    // Get tile size mask
    size_mask = TILE_SIZE - 1
	
	// Get sensor position
    if (sensor == 0)
    {
		s_x = scr_get_sensor_x(quadrant, -width, height);
		s_y = scr_get_sensor_y(quadrant, -width, height);
    }
    else
    {
		s_x = scr_get_sensor_x(quadrant, width, height);
		s_y = scr_get_sensor_y(quadrant, width, height);
    }
 
	// Reposition sensor to adjacent block and choose which axis to use
	switch (quadrant)
	{
		default:
		case 2:
			s_y += TILE_SIZE * adj_dir * ((quadrant > 1) ? -1 : 1);
			s_pos = s_y;
			break;
		
		case 1:
		case 3:
			s_x += TILE_SIZE * adj_dir * ((quadrant > 1) ? -1 : 1);
			s_pos = s_x;
			break;
	}
 
    // Get tile
    tile = scr_find_nearest_tile(map_id, s_x, s_y);
    if (!tile)
        return size_mask - (s_pos & size_mask);
		
    t_angle = scr_tile_get_angle(tile);
    t_length = scr_get_tile_length(tile, s_x, s_y, quadrant);
 
    // Set sensor flags
    if (sensor == 0)
    {
        col_sensor_A = true;
        col_tile_A = tile;
        col_angle_A = t_angle;
    }
    else
    {
        col_sensor_B = true;
        col_tile_B = tile;
        col_angle_B = t_angle;
    }
 
    // Check length
    if (t_length == 0)
    {
        // 0 length
        return size_mask - (s_pos & size_mask);
    }
    else if (t_length < 0)
    {
        // Negative length
        neg_dist = t_length + (s_pos & size_mask);
        if (neg_dist >= 0)
            return size_mask - (s_pos & size_mask);
        else
            return ~neg_dist;
    }
 
    // Normal length
    return size_mask - (t_length + (s_pos & size_mask));
}