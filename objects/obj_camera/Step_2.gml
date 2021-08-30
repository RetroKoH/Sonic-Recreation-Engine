/// @description Set position of view

camera_set_view_size(view, view_width, view_height);

x=camera_get_view_x(view)+view_width/2;
y=camera_get_view_y(view)+view_height/2;

if instance_exists(follow)
{
	if (follow.routine >= 3)
	{
		follow = noone;
		camera_set_view_target(view,noone);
	}

	else
	{
		if camera_get_view_target(view) != follow camera_set_view_target(view,follow);
		var _x = clamp(camera_get_view_x(view), v_limitleft1, v_limitright1-view_width-16);
		var _y = clamp(camera_get_view_y(view), v_limittop1, v_limitbtm1-view_height-16);
		camera_set_view_pos(view, _x, _y);
	}
}