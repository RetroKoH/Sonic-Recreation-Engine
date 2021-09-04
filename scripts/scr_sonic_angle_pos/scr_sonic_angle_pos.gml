function scr_sonic_angle_pos(){
	// Subroutine to change Sonic's angle and position as he walks along the floor.
	// The code checks for relative_angle, to accomodate for different gravity directions.
 
	var quadrant,dist_r,dist_l,t_real,angle_real,dist_real,fall_dist;
 
	// Set flat angle if standing on an object.
	if (status&STA_ONOBJ) // If standing on object
	{
//	    v_anglebuffer1=gravity_angle;
//	    v_anglebuffer2=gravity_angle;
//	    scrSetAngle(gravity_angle);
		angle = 0;
	    exit;
	}
 
	// Otherwise, find tiles along the ground Sonic is on
	else
	{
		// Get quadrant
		quadrant = scr_get_quadrant(angle);
		
        // Get tile distances
		dist_l = scr_get_floor_dist(-width, height, quadrant);
		col_sensor_A = col_sensor;
		col_tile_A = col_tile;
		col_angle_A = col_angle;

		dist_r = scr_get_floor_dist(width, height, quadrant);
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
		
        // Check wall latching and set angle
        if (abs(scr_get_signed_angle(scr_wrap_angle(angle_real - angle))) >= 45)
            angle = floor(scr_wrap_angle(angle + 45) / 90) * 90;
        else
            angle = angle_real;
 
        // Check vertical distance
        if (dist_real > 0)
        {
			if ((quadrant & 1) == 0)
				fall_dist = abs(xsp) + 4;
			else
				fall_dist = abs(ysp) + 4;
            if (fall_dist > 14)
                fall_dist = 14;
 
            if (dist_real > fall_dist)
            {
			    status|=STA_INAIR; // Set air flag
			    angle = 0; //scrSetAngle(gravity_angle);
            }
            else
			{
				if ((quadrant & 1) == 0)
					y += dist_real * ((quadrant > 1) ? -1 : 1);
				else
					x += dist_real * ((quadrant > 1) ? -1 : 1);
			}
        }
        else if (dist_real < 0 && dist_real > -14)
        {
			if ((quadrant & 1) == 0)
				y += dist_real * ((quadrant > 1) ? -1 : 1);
			else
				x += dist_real * ((quadrant > 1) ? -1 : 1);
        }
	}
}
