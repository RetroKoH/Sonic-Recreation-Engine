/// @description Set position of view
var view = view_camera[0]

camera_set_view_size(view, view_width, view_height);

if instance_exists(follow)
{
	var _x = clamp(follow.x - view_width/2, v_limitleft1, v_limitright1-view_width);
	var _y = clamp(follow.y - view_height/2, v_limittop1, v_limitbtm1-view_height);
	camera_set_view_pos(view, _x, _y);
}