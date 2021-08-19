function scr_sonic_angle_pos(){
	// Subroutine to change Sonic's angle and position as he walks along the floor.
	// The code checks for relative_angle, to accomodate for different gravity directions.

	var t_h,t_r,t_r2,t_l,t_l2,ang_r,hgt_r,ang_l,hgt_l;

	// Set flat angle if standing on an object.
	if (status&8) // If standing on object
	{
//	    v_anglebuffer1=gravity_angle;
//	    v_anglebuffer2=gravity_angle;
//	    scrSetAngle(gravity_angle);
		angle = 0;
	    exit;
	}


	// Otherwise, operate under Floor Mode
	//else
	{
		var y_r = 0, y_l = 0; // Y-position of detected tiles

	    // RIGHT SENSOR
	    t_h=floor(x)+width
	    t_r=scr_find_nearest_tile(map_id, t_h, y+height); // Find nearest tile to Sonic.

	    if(t_r) // if a tile is detected,
	    {
			if tile_get_mirror(t_r)
			{
				ang_r=360-ds_grid_get(col_angles,tile_get_index(t_r),0);							// Get tile's inverse angle value
				hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),TILE_SIZE-1-(t_h&(TILE_SIZE-1)));	// Get tile's mirrored height array value.
			}
			else
			{
				ang_r=ds_grid_get(col_angles,tile_get_index(t_r),0);					// Get tile's angle value
				hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),t_h&(TILE_SIZE-1));	// Get tile's height array value.
			}
			y_r = scr_tile_get_coord(y+height);
			col_sensor_B=true;
    
	        if hgt_r == TILE_SIZE // If height is max, search for another tile above.
	        {
	            t_r2=scr_find_nearest_tile(map_id, t_h, (y+height)-TILE_SIZE);
	            if(t_r2) // if tile exists
	            {
	                t_r=t_r2;
					if tile_get_mirror(t_r)
					{
						ang_r=360-ds_grid_get(col_angles,tile_get_index(t_r),0);							// Get tile's inverse angle value
						hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),TILE_SIZE-1-(t_h&(TILE_SIZE-1)));	// Get tile's mirrored height array value.
					}
					else
					{
						ang_r=ds_grid_get(col_angles,tile_get_index(t_r),0);					// Get tile's angle value
						hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),t_h&(TILE_SIZE-1));	// Get tile's height array value.
					}
					y_r = scr_tile_get_coord(y+height-TILE_SIZE);
	                col_sensor_B=true;
	            }
	        }
	    }
	    else // if a tile is not detected
	    {
	        t_r=scr_find_nearest_tile(map_id, t_h, y+height+TILE_SIZE); // check 16 pixels below.
	        if(t_r) // if tile exists
	        {
				if tile_get_mirror(t_r)
				{
					ang_r=360-ds_grid_get(col_angles,tile_get_index(t_r),0);							// Get tile's inverse angle value
					hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),TILE_SIZE-1-(t_h&(TILE_SIZE-1)));	// Get tile's mirrored height array value.
				}
				else
				{
					ang_r=ds_grid_get(col_angles,tile_get_index(t_r),0);					// Get tile's angle value
					hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),t_h&(TILE_SIZE-1));	// Get tile's height array value.
				}
				y_r = scr_tile_get_coord(y+height+TILE_SIZE);
	            col_sensor_B=true;
	        }
	        else // if a tile is not detected
	        {
	            ang_r=0;
	            hgt_r=0;
	            col_sensor_B=false;
	        }
	    }
	    col_tile_B=t_r;

	    // LEFT SENSOR
	    t_h=floor(x)-width;							// Get x-pos of object.
	    t_l=scr_find_nearest_tile(map_id, t_h, y+height);	// Find nearest tile to Sonic.

	    if(t_l) // if a tile is detected,
	    {
			if tile_get_mirror(t_l)
			{
				ang_l=360-ds_grid_get(col_angles,tile_get_index(t_l),0);							// Get tile's inverse angle value
				hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),TILE_SIZE-1-(t_h&(TILE_SIZE-1)));	// Get tile's mirrored height array value.
			}
			else
			{
				ang_l=ds_grid_get(col_angles,tile_get_index(t_l),0);					// Get tile's angle value
				hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),t_h&(TILE_SIZE-1));	// Get tile's height array value.
			}
			y_l = scr_tile_get_coord(y+height);
			col_sensor_A=true;
    
	        if hgt_l == TILE_SIZE // If height is max, search for another tile above.
	        {
	            t_l2=scr_find_nearest_tile(map_id, t_h, (y+height)-TILE_SIZE)
	            if(t_l2) // if tile exists
	            {
	                t_l=t_l2;
					if tile_get_mirror(t_l)
					{
						ang_l=360-ds_grid_get(col_angles,tile_get_index(t_l),0);							// Get tile's inverse angle value
						hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),TILE_SIZE-1-(t_h&(TILE_SIZE-1)));	// Get tile's mirrored height array value.
					}
					else
					{
						ang_l=ds_grid_get(col_angles,tile_get_index(t_l),0);					// Get tile's angle value
						hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),t_h&(TILE_SIZE-1));	// Get tile's height array value.
					}
					y_l = scr_tile_get_coord((y+height)-TILE_SIZE);
	                col_sensor_A=true;
	            }
	        }
	    }

	    else // if a tile is not detected, or it is the first tile, aka blank tile.
	    {
	        t_l=scr_find_nearest_tile(map_id, t_h, y+height+TILE_SIZE); // check 16 pixels below.
    
	        if(t_l)
	        {
				if tile_get_mirror(t_l)
				{
					ang_l=360-ds_grid_get(col_angles,tile_get_index(t_l),0);							// Get tile's inverse angle value
					hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),TILE_SIZE-1-(t_h&(TILE_SIZE-1)));	// Get tile's mirrored height array value.
				}
				else
				{
					ang_l=ds_grid_get(col_angles,tile_get_index(t_l),0);					// Get tile's angle value
					hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),t_h&(TILE_SIZE-1));	// Get tile's height array value.
				}
				y_l = scr_tile_get_coord((y+height)+TILE_SIZE);
	            col_sensor_A=true;
	        }
	        else
	        {
	            ang_l=0;
	            hgt_l=0;
	            col_sensor_A=false;
	        }
	    }
	    col_tile_A=t_l;

	    // After checking height distances, set height and angle.
	    if (hgt_r==0) && (hgt_l==0)
	    {
			status |= 2; //consStatusInAir;
			angle = 0; //scrSetAngle(gravity_angle);
	    }

	    else
	    {
	        if t_r
				var real_hgt_r=y_r+((TILE_SIZE-1)-hgt_r)-(height); else real_hgt_r=y+height;
	        if t_l
				var real_hgt_l=y_l+((TILE_SIZE-1)-hgt_l)-(height); else real_hgt_l=y+height;

			if (real_hgt_r<real_hgt_l)
			{
				angle = ang_r;	//scrSetAngle(ang_r); 
				y = real_hgt_r;	// Simply sets Sonic's position to accomodate to the tile's height.
			}

			else // if (real_hgt_l<=real_hgt_r) 
			{
				angle = ang_l	//scrSetAngle(ang_l);
				y = real_hgt_l;	// Simply sets Sonic's position to accomodate to the tile's height.
			}
		}
	}
}