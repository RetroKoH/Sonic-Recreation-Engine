// Subroutine to change the player's angle and position while walking along the floor.
function scr_player_angle_pos(){
	scr_check_walls_on_ground();	// Check for walls on the ground
 
	// Set flat angle if standing on an object.
	if (status&STA_ONOBJ) // If standing on object
	{
		angle = 0;
	    exit;
	}
 
	// Otherwise, find tiles along the ground Sonic is on
	else
	{
		// Get tile distance
		var quadrant = scr_get_quadrant(angle);
		var dist_real = scr_player_get_floor_dist(quadrant);
		var angle_real = col_angle;
		
        // Check wall latching and set angle
        if (abs(scr_get_signed_angle(scr_wrap_angle(angle_real - angle))) >= 45)
            angle = floor(scr_wrap_angle(angle + 45) / 90) * 90;
        else
            angle = angle_real;
 
        // Check distance
		var collided = false;
        if (dist_real > 0)
        {
			var fall_dist;
			if ((quadrant & 1) == 0)
				fall_dist = abs(xsp) + 4;
			else
				fall_dist = abs(ysp) + 4;
            if (fall_dist > 14)
                fall_dist = 14;
 
            if (dist_real > fall_dist)
            {
			    status|=STA_INAIR; // Set air flag
			    //angle = 0; //scrSetAngle(gravity_angle); Remove this to allow player to rotate in air
            }
            else
				collided = true;
        }
        else if (dist_real < 0) // && dist_real > -14) <- Disabling this fixes a bug with angles
			collided = true;
		
		// Check if we should align with the floor
		if (collided)
		{
			if ((quadrant & 1) == 0)
				y += dist_real * ((quadrant > 1) ? -1 : 1);
			else
				x += dist_real * ((quadrant > 1) ? -1 : 1);
		}
		
		// Round position down to integer (The original games do not do this!)
		if ((quadrant & 1) == 0)
			y = floor(y);
		else
			x = floor(x);
	}
}
