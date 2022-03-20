function scr_touch_objPlatform(){
	// Handles collision with solid and top-solid platform objects
	var obj, dist;

	// Vertical collision (if there is a block at the expected location based on ysp)
	if (status&STA_ONOBJ)
	{
	    if !(place_meeting(x,y+1,platform_ID)) //!(place_meeting(x,y+1,objParent_Platform))
		{
			if platform_ID.object_index == obj18_Platform
				platform_ID.routine--;
			platform_ID = -1;
			status^=STA_ONOBJ;
		}
	    else
	    {
	        obj = instance_place(x,y+1,platform_ID); //instance_place(x,y+1,objParent_Platform);
	        if obj.ptfm_solid==false
			{
				if platform_ID.object_index == obj18_Platform
					platform_ID.routine--;
				platform_ID = -1;
				status^=STA_ONOBJ;
			}
	    }
	}

	else
	{
	    //Floor
	    dist=max(abs(ysp),1)*sign(ysp);
	    obj=instance_place(x, y+dist, objParent_Solid);
	    if ((obj) && (obj.ptfm_solid)) //&& !place_meeting(x, y, obj)
	    && collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+ysp+1, obj, false, false)
		{
			if obj.object_index == obj26_Monitor && player.anim_ID == anim_player.roll
			{
				obj.routine++;
				// Rebound off the monitor, provided we are moving downward, and are NOT on the ground.
		        if ((status&STA_INAIR) && ysp>0)
		        {
		            // Check for the jump button being held.
		            if (global.k_a_h || global.k_b_h || global.k_c_h)
						ysp = -ysp*1.15;
		            else ysp = -ysp*0.99;
		        }
			}
			else
			{
				angle = 0;
				y=obj.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));		// Sets Sonic's position to the tile's height.
		        ysp = 0; gsp = xsp;
				scr_player_acquirefloor();
				platform_ID = obj;
				status|=STA_ONOBJ;
			}
		}
	}

	// Side
	if (xsp==0) dist=1; else dist=max(abs(xsp),1)*sign(xsp);
	obj=instance_place(x+dist, y, objParent_Solid);
	if ((obj) && (obj.ptfm_solid)) && !collision_rectangle(bbox_left+4, bbox_bottom, bbox_right-4, bbox_bottom+3, obj, false, false)
	{
	    // Object to your left
	    if (x>obj.x && xsp < 0)
		{
			if obj.object_index == obj26_Monitor && player.anim_ID == anim_player.roll
			{
				obj.routine++;
				// Rebound off the monitor, provided we are moving downward, and are NOT on the ground.
		        if ((status&STA_INAIR) && ysp>0)
		        {
		            // Check for the jump button being held.
		            if (global.k_a_h || global.k_b_h || global.k_c_h)
						ysp = -ysp*1.15;
		            else ysp = -ysp*0.99;
		        }
			}
			else
			{
		        x=obj.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
				// Stop forward motion
				gsp = 0;
			    xsp = 0;
				if !(status&STA_INAIR) status|=STA_PUSH;
				else if (status&STA_PUSH) status^=STA_PUSH;
			}
		}
	    // Walls to your right
	    else if (x<obj.x && xsp > 0)
		{
			if obj.object_index == obj26_Monitor && player.anim_ID == anim_player.roll
			{
				obj.routine++;
				// Rebound off the monitor, provided we are moving downward, and are NOT on the ground.
		        if ((status&STA_INAIR) && ysp>0)
		        {
		            // Check for the jump button being held.
		            if (global.k_a_h || global.k_b_h || global.k_c_h)
						ysp = -ysp*1.15;
		            else ysp = -ysp*0.99;
		        }
			}
			else
			{
		        x=obj.bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
				// Stop forward motion
				gsp = 0;
			    xsp = 0;
				if !(status&STA_INAIR) status|=STA_PUSH;
				else if (status&STA_PUSH) status^=STA_PUSH;
			}
		}
	}

	//Ceiling
	dist=max(abs(ysp),1)*sign(ysp);
	obj=instance_place(x, y+dist, objParent_Solid);
	if ((obj) && (obj.ptfm_solid)) && (obj.y<y) && !place_meeting(x, y, obj)
	{
	    y = obj.bbox_bottom + sprite_get_yoffset(mask_index) + 1;
	    if (ysp<0) ysp=0;
	}

	//Topsolids
	dist=max(ysp,1); //dist=max(abs(ysp),1)*sign(ysp);
	obj=instance_place(x, bbox_bottom+dist, objParent_TopSolid);
	if ((obj) && (obj.ptfm_solid)) && (ysp>0)
	    //if !place_meeting(x, y, obj)
		{
			angle = 0;
			y=obj.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));		// Sets Sonic's position to the tile's height.
	        ysp = 0; gsp = xsp;
			scr_player_acquirefloor();
			platform_ID = obj;
			status|=STA_ONOBJ;
			if platform_ID.object_index == obj18_Platform
					platform_ID.routine++;
		}
}