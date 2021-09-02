function scr_sonic_get_tile_dist_y(sensor, direction){
    // Subroutine to find the distance from the floor/ceiling as he walks along the floor
    var s_x, s_y, size_mask, tile, t_angle, t_height;
 
    // Get tile size mask
    size_mask = TILE_SIZE - 1
 
    // Get sensor X position and reset flags
    s_x = floor(x);
    if (sensor == 0)
    {
        col_sensor_A = false;
        s_x -= width;
    }
    else
    {
        col_sensor_B = false;
        s_x += width;
    }
 
    // Get sensor Y position
    s_y = floor(y) + (height * direction);
    if (direction < 0)
        s_y ^= size_mask;
 
    // Get tile
    tile = scr_find_nearest_tile(map_id, s_x, s_y);
    if (!tile)
    {
        return scr_sonic_find_floor_adj(sensor, s_x, s_y, direction, direction) + TILE_SIZE;
    }
    t_angle = scr_tile_get_angle(tile);
    t_height = scr_tile_get_height(tile, s_x);
    if (direction < 0)
        t_height = -t_height;
 
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
 
    // Check height
    if (t_height == 0)
    {
        // 0 height
        return scr_sonic_find_floor_adj(sensor, s_x, s_y, direction, direction) + TILE_SIZE;
    }
    else if (t_height < 0)
    {
        // Negative height
        if (t_height + (s_y & size_mask) >= 0)
            return scr_sonic_find_floor_adj(sensor, s_x, s_y, direction, direction) + TILE_SIZE;
        else
            return scr_sonic_find_floor_adj(sensor, s_x, s_y, direction, -direction) - TILE_SIZE;
    }
    else if (t_height == TILE_SIZE)
    {
        // Max height
        return scr_sonic_find_floor_adj(sensor, s_x, s_y, direction, -direction) - TILE_SIZE;
    }
 
    // Normal height
    return size_mask - (t_height + (s_y & size_mask));
}
 
function scr_sonic_find_floor_adj(sensor, s_x, s_y, direction, adj_dir){
    // Continued checking for distance from the floor/ceiling if needed
 
    var size_mask, tile, t_angle, t_height, neg_dist;
 
    // Get tile size mask
    size_mask = TILE_SIZE - 1
 
    // Get sensor Y position
    s_y += TILE_SIZE * adj_dir;
 
    // Get tile
    tile = scr_find_nearest_tile(map_id, s_x, s_y);
    if (!tile)
    {
        return size_mask - (s_y & size_mask);
    }
    t_angle = scr_tile_get_angle(tile);
    t_height = scr_tile_get_height(tile, s_x);
    if (direction < 0)
        t_height = -t_height;
 
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
 
    // Check height
    if (t_height == 0)
    {
        // 0 height
        return size_mask - (s_y & size_mask);
    }
    else if (t_height < 0)
    {
        // Negative height
        neg_dist = t_height + (s_y & size_mask);
        if (neg_dist >= 0)
            return size_mask - (s_y & size_mask);
        else
            return ~neg_dist;
    }
 
    // Normal height
    return size_mask - (t_height + (s_y & size_mask));
}