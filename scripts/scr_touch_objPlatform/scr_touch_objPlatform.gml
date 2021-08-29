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
			angle = 0;
			y=obj.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));		// Sets Sonic's position to the tile's height.
	        scr_sonic_acquirefloor();
			platform_ID = obj;
			status|=STA_ONOBJ;
		}
	}

	// Side
	if (xsp==0) dist=1; else dist=max(abs(xsp),1)*sign(xsp);
	obj=instance_place(x+dist, y, objParent_Solid);
	if obj && !collision_rectangle(bbox_left+4, bbox_bottom, bbox_right-4, bbox_bottom+3, obj, false, false)
	{
	    // Object to your left
	    if (x>obj.x && xsp < 0)
		{
	        x=obj.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
			// Stop forward motion
			gsp = 0;
		    xsp = 0;
			if !(status&STA_INAIR) status|=STA_PUSH;
			else if (status&STA_PUSH) status^=STA_PUSH;
		}
	    // Walls to your right
	    else if (x<obj.x && xsp > 0)
		{
	        x=obj.bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
			// Stop forward motion
			gsp = 0;
		    xsp = 0;
			if !(status&STA_INAIR) status|=STA_PUSH;
			else if (status&STA_PUSH) status^=STA_PUSH;
		}
	}

	//Topsolids
	dist=max(abs(ysp),1)*sign(ysp);
	obj=instance_place(x, y+dist, objParent_TopSolid);
	if ((obj) && (obj.ptfm_solid)) && (ysp>0)
	    //if !place_meeting(x, y, obj)
		{
			angle = 0;
			y=obj.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));		// Sets Sonic's position to the tile's height.
	        scr_sonic_acquirefloor();
			platform_ID = obj;
			status|=STA_ONOBJ;
			if platform_ID.object_index == obj18_Platform
					platform_ID.routine++;
		}
}