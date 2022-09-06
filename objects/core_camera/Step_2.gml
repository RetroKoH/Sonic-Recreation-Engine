/// @description Set position of view

if instance_exists(follow)
{
	if (follow == player)
	{
		if (follow.routine >= 3)
		{
			follow = noone;
			camera_set_view_target(view,noone);
		}
		else
		{
			if (camera_get_view_target(view) != self) camera_set_view_target(view,self);
			//var _w = view_width/2, _h = view_height/2;
			x=clamp(follow.x, v_limitleft1+204, v_limitright1-204);
			y=clamp(follow.y, v_limittop1+98, v_limitbtm1-98);
			viewX = clamp(camera_get_view_x(view), v_limitleft1, max(v_limitleft1,v_limitright1-view_width-16));
			viewY = clamp(camera_get_view_y(view), v_limittop1, max(v_limittop1,v_limitbtm1-view_height-16));
			camera_set_view_pos(view, viewX, viewY);
		}
	}
}