function scr_get_tile_dist(sensor_x, sensor_y, quadrant){
    // Subroutine to find the distance from a tile at any given direction
 
	var s_x, s_y, s_pos, size_mask, tile, t_angle, t_length;
 
    // Get tile size mask
    size_mask = TILE_SIZE - 1
 
    // Get sensor position
    s_x = scr_get_sensor_x(quadrant, sensor_x, sensor_y);
    s_y = scr_get_sensor_y(quadrant, sensor_x, sensor_y);
 
	// Choose which axis to use
	s_pos = s_y;
	if ((quadrant & 1) == 1)
		s_pos = s_x;
 
    // Get tile
    tile = scr_find_nearest_tile(map_id, s_x, s_y);
    if (!tile)
        return scr_get_tile_dist_adj(s_x, s_y, quadrant, 1) + TILE_SIZE;
	
	// TODO: CHECK SOLIDITY
	// QUADRANT 0: CHECK TOP SOLID
	// OTHER QUADRANTS: CHECK LRB SOLID
 
    t_angle = scr_tile_get_angle(tile);
    t_length = scr_get_tile_length(tile, s_x, s_y, quadrant);
 
    // Set sensor flags
    col_tile = tile;
    col_angle = t_angle;
 
    // Check length
    if (t_length == 0)
    {
        // 0 length
        return scr_get_tile_dist_adj(s_x, s_y, quadrant, 1) + TILE_SIZE;
    }
    else if (t_length < 0)
    {
        // Negative length
        if (t_length + (s_pos & size_mask) >= 0)
            return scr_get_tile_dist_adj(s_x, s_y, quadrant, 1) + TILE_SIZE;
        return scr_get_tile_dist_adj(s_x, s_y, quadrant, -1) - TILE_SIZE;
    }
    else if (t_length == TILE_SIZE)
    {
        // Max length
        return scr_get_tile_dist_adj(s_x, s_y, quadrant, -1) - TILE_SIZE;
    }
 
    // Normal length
    return size_mask - (t_length + (s_pos & size_mask));
}
 
function scr_get_tile_dist_adj(s_x, s_y, quadrant, adj_dir){
    // Continued checking for finding the distance from a tile at any given direction, if needed
 
    var s_pos, size_mask, tile, t_angle, t_length, neg_dist;
 
    // Get tile size mask
    size_mask = TILE_SIZE - 1
 
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
    col_tile = tile;
    col_angle = t_angle;
 
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

function scr_get_floor_dist(sensor_x, sensor_y, quadrant){
  return scr_get_tile_dist(sensor_x, sensor_y, quadrant);
}

function scr_get_right_wall_dist(sensor_x, sensor_y, quadrant){
  return scr_get_tile_dist(-sensor_y, sensor_x, (quadrant + 1) & 3);
}

function scr_get_ceiling_dist(sensor_x, sensor_y, quadrant){
  return scr_get_tile_dist(-sensor_x, -sensor_y, (quadrant + 2) & 3);
}

function scr_get_left_wall_dist(sensor_x, sensor_y, quadrant){
  return scr_get_tile_dist(sensor_y, -sensor_x, (quadrant + 3) & 3);
}