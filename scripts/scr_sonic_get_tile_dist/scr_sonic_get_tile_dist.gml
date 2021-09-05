function scr_sonic_get_floor_dist(quadrant){
	var dist;
	
	// Get tile distances
	var dist_l = scr_get_floor_dist(-width, height, quadrant);
	col_sensor_A = dist_l < ((status&STA_INAIR) ? 1 : 14);
	col_tile_A = col_tile;
	col_angle_A = col_angle;

	var dist_r = scr_get_floor_dist(width, height, quadrant);
	col_sensor_B = dist_r < ((status&STA_INAIR) ? 1 : 14);
	col_tile_B = col_tile;
	col_angle_B = col_angle;

    // Get shortest distance and set angle
    if (dist_l < dist_r)
    {
        dist = dist_l;
		col_other_dist = dist_r;
        col_angle = col_angle_A;
    }
    else
    {
        dist = dist_r;
		col_other_dist = dist_l;
        col_angle = col_angle_B;
    }
	
	return dist;
}

function scr_sonic_get_left_wall_dist(quadrant){
	var sensorY = (!(status&STA_INAIR) && (angle < 11.25 || angle > 348.75)) ? 8 : 0;
	var dist = scr_get_left_wall_dist(-10, sensorY, quadrant);
	col_sensor_E = dist <= 0;
	col_tile_E = col_tile;
	return dist;
}

function scr_sonic_get_ceiling_dist(quadrant){
	var dist;
	
	// Get tile distances
	var dist_l = scr_get_ceiling_dist(-width, -height, quadrant);
	col_sensor_C = dist_l <= 0;
	col_tile_C = col_tile;
	col_angle_C = col_angle;

	var dist_r = scr_get_ceiling_dist(width, -height, quadrant);
	col_sensor_D = dist_r <= 0;
	col_tile_D = col_tile;
	col_angle_D = col_angle;

    // Get shortest distance
    if (dist_l < dist_r)
	{
        dist = dist_l;
		col_other_dist = dist_r;
        col_angle = col_angle_C;
	}
    else
	{
        dist = dist_r;
		col_other_dist = dist_l;
        col_angle = col_angle_D;
	}
		
	return dist;
}

function scr_sonic_get_right_wall_dist(quadrant){
	var sensorY = (!(status&STA_INAIR) && (angle < 11.25 || angle > 348.75)) ? 8 : 0;
	var dist = scr_get_right_wall_dist(10, sensorY, quadrant);
	col_sensor_F = dist <= 0;
	col_tile_F = col_tile;
	return dist;
}