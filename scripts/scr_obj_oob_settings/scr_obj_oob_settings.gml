function scr_obj_OOB_settings(setting){
	if !variable_instance_exists(id, "Obj_UnloadState")
	{
		OOB_data  = [x, y, image_xscale, image_yscale, image_index, sprite_index, visible];
		OOB_state = true;
	}
	OOB_flag = setting;
}