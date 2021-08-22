/// @description Draw debug info on the camera
if debug{
	draw_text(600,4,"CAM TARGET "+string(camera_get_view_target(view)));
	draw_text(600,24,"CAM X "+string(camera_get_view_x(view))+" ("+string(v_limitright1-view_width)+")");
	draw_text(600,48,"CAM Y "+string(camera_get_view_y(view))+" ("+string(v_limitbtm1-view_height)+")");
}