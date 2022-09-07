/// @description Debug Info
if debug{
	draw_text(10,4,"CAM TARGET "+string(camera_get_view_target(view)));
	draw_text(10,24,"CAM X "+string(camera_get_view_x(view))+" ("+string(v_limitleft1)+", "+string(v_limitright1-view_width)+")");
	draw_text(10,48,"CAM Y "+string(camera_get_view_y(view))+" ("+string(v_limitbtm1-view_height)+")");
}