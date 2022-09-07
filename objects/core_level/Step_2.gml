/// @description In-Level Processes

if (time_running) {
	if (f_timecount) p_time++;			// Increment level time
	framecount++; framecount%=$10000;	// Add 1 to frame-by-frame timer
	if (osc_active) scr_osc_num_do();	// Run osc values
	scr_sync_anim();					// Run Sync Animations
}

if (run_objects)
{
	// Set active object bounds, accurate to the originals
	var bound_top	= (Core_Camera.viewY & -128) - 128;
	var bound_btm	= (Core_Camera.viewY & -128) + VIEW_HEIGHT + SCR_HEIGHT;
	var bound_left	= (Core_Camera.viewX & -128) - 128;
	var bound_right	= (Core_Camera.viewX & -128) + VIEW_WIDTH + SCR_WIDTH;
	
	with(obj00_LevelObjects) switch(OOB_flag)	// Behavior depends on flag attributed to object
	{
		case OOB_DESTROY:
			if ((x < bound_left) || (x > bound_right) || (y > bound_btm) || (y < bound_top))
				instance_destroy();
		break;
		case OOB_PAUSE:
			if ((x < bound_left) || (x > bound_right))
				if ((OOB_data[0] < bound_left) || (OOB_data[0] > bound_right))
					instance_deactivate_object(id);
		break;
		case OOB_RESET:
			if ((x < bound_left) || (x > bound_right))
					if ((OOB_data[0] < bound_left) || (OOB_data[0] > bound_right))
					{
						// Reset data
						x			 = OOB_data[0];
						y			 = OOB_data[1];
						image_xscale = OOB_data[2];
						image_yscale = OOB_data[3];
						image_index  = OOB_data[4];
						sprite_index = OOB_data[5];
						visible      = OOB_data[6];
							
						// Reset animation data
						if (has_anims) scr_reset_anim();
									
						// Perform create event to re-initialise variables and then deactivate object
						event_perform(ev_create, 0);
						instance_deactivate_object(id);
					} else
					{
						// Make object "disappear" until its initial position goes off-screen
						x = -128;
						y = -128;
								
						// Call Create event in case object is using its own variables for positioning
						event_perform(ev_create, 0);
					}
		break;
	}
} scr_obj_activate_range(Core_Camera.viewX); // Load objects (objects that were deactivated on this frame won't be activated!)
		