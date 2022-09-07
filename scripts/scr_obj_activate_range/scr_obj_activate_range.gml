function scr_obj_activate_range(anchor){
	// Load region
	instance_activate_region((anchor & -128) - 128, 0, 128 + VIEW_WIDTH + SCR_WIDTH, room_height, true);
}