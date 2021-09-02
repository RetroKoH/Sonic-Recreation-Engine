function scr_sonic_angle_pos(){
	// Subroutine to change Sonic's angle and position as he walks along the floor.
	// The code checks for relative_angle, to accomodate for different gravity directions.
 
	var dist_r,dist_l,t_real,angle_real,dist_real,fall_dist;
 
	// Set flat angle if standing on an object.
	if (status&STA_ONOBJ) // If standing on object
	{
//	    v_anglebuffer1=gravity_angle;
//	    v_anglebuffer2=gravity_angle;
//	    scrSetAngle(gravity_angle);
		angle = 0;
	    exit;
	}
 
	// Otherwise, operate under Floor Mode
	else
	{
        // Get tile distances
        dist_l = scr_sonic_get_tile_dist_y(0, 1);
        dist_r = scr_sonic_get_tile_dist_y(1, 1);
 
        // Get shortest distance and set angle
        if (dist_l < dist_r)
        {
            dist_real = dist_l;
            angle_real = col_angle_A;
            real_tile = col_tile_A;
        }
        else
        {
            dist_real = dist_r;
            angle_real = col_angle_B;
            real_tile = col_tile_B;
        }
 
		angle = angle_real;
        // Check wall latching and set angle
        //if (scr_wrap_angle(angle - angle_real) >= 45)
          //  angle = floor(scr_wrap_angle(angle - 45) / 90) * 90;
        //else
          //  angle = angle_real;
 
        // Check vertical distance
        if (dist_real > 0)
        {
            fall_dist = abs(xsp) + 4;
            if (fall_dist > 14)
                fall_dist = 14;
 
            if (dist_real > fall_dist)
            {
			    status|=STA_INAIR; // Set air flag
			    angle = 0; //scrSetAngle(gravity_angle);
            }
            else
                y += dist_real;
        }
        else if (dist_real < 0 && dist_real > -14)
        {
            y += dist_real;
        }
	}
}
