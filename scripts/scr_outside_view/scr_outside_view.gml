function scr_outside_view(){
	var c = cam.view;

	if ((bbox_right > camera_get_view_x(c)) &&
		(bbox_left < (camera_get_view_x(c) + camera_get_view_width(c))) &&
		(bbox_bottom > camera_get_view_y(c)) &&
		(bbox_top < camera_get_view_y(c) + camera_get_view_height(c)))
		return false;

	return true;
}