function scr_obj_activate_range(anchor){
	// Load region
	instance_activate_region((anchor & -128) - 128, 0, 128 + SCR_WIDTH+64 + SCR_WIDTH, room_height, true);
}