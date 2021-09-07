function scr_obj_check_floor(){
	// Find the floor when falling
	var t_h,t_r,t_l,ang_r,hgt_r,ang_l,hgt_l;
	{
		var y_r = 0, y_l = 0; // Y-position of detected tiles

	    // RIGHT SENSOR
	    t_h=floor(x)+width
	    t_r=scr_find_nearest_tile(map_id[col_path], t_h, y+height); // Find nearest tile to Sonic.
    
	    if(t_r) // if a tile is detected,
	    {
			ang_r=ds_grid_get(col_angles,tile_get_index(t_r),0);					// Get tile's angle value
			hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),t_h&(TILE_SIZE-1));	// Get tile's height array value.
			y_r = scr_tile_get_coord(y+height);
	    }
    
	    else // if a tile is not detected
	    {
	        t_r=scr_find_nearest_tile(map_id[col_path], t_h, y+height+TILE_SIZE); // check 16 pixels below.
        
	        if(t_r) // If tile exists
	        {
				ang_r=ds_grid_get(col_angles,tile_get_index(t_r),0);					// Get tile's angle value.
				hgt_r=ds_grid_get(col_normal,tile_get_index(t_r),t_h&(TILE_SIZE-1));	// Get tile's height array value.
				y_r = scr_tile_get_coord(y+height+TILE_SIZE);
	        }
	        else // if a tile is not detected
	        {
	            ang_r=0;
	            hgt_r=0;
	        }
	    }
    
	    // LEFT SENSOR
	    t_h=floor(x)-width;									// Get x-pos of object.
	    t_l=scr_find_nearest_tile(map_id[col_path], t_h, y+height);	// Find nearest tile to Sonic.
    
	    if(t_l) // if a tile is detected,
	    {
	        ang_l=ds_grid_get(col_angles,tile_get_index(t_l),0);					// Get tile's angle value.
	        hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),t_h&(TILE_SIZE-1));	// Get tile's height array value.
			y_l = scr_tile_get_coord(y+height);
	    }
    
	    else // if a tile is not detected, or it is the first tile, aka blank tile.
	    {
			t_l=scr_find_nearest_tile(map_id[col_path], t_h, y+height+TILE_SIZE); // check 16 pixels below.
        
			if(t_l)
			{
			    ang_l=ds_grid_get(col_angles,tile_get_index(t_l),0);					// Get tile's angle value.
			    hgt_l=ds_grid_get(col_normal,tile_get_index(t_l),t_h&(TILE_SIZE-1));	// Get tile's height array value.
				y_l = scr_tile_get_coord((y+height)+TILE_SIZE);
			}
			else
			{
			    ang_l=0;
			    hgt_l=0;
				return false;
			}
		}

		// After checking height distances, set height and angle (Only if moving downward.
	    if (ysp>0 && (hgt_r!=0 || hgt_l!=0))
	    {
	        {
	            var y_val,a_val;
	            if (hgt_r>=hgt_l || hgt_l==0)
	            {
	                a_val=ang_r; 
	                y_val=(y_r+(TILE_SIZE-hgt_r))-(height); // Simply sets Sonic's position to accomodate to the tile's height.
	            }
    
	            else
	            {
	                a_val=ang_l;
	                y_val=(y_l+(TILE_SIZE-hgt_l))-(height); // Simply sets Sonic's position to accomodate to the tile's height.
	            }
	        }
        
	        if y>y_val  //y>tile_get_y(t)-(height+1)
	        {
	            angle = a_val;	//scrSetAngle(a_val);
	            y=y_val;		// Sets Sonic's position to the tile's height.
				return true;
	        }
	    }
	}
}