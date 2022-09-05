/// @description Insert description here
if debug{
	draw_sprite_ext(spr_debug_center,0,x,y,2,2,0,c_red,0.75);		// Camera object's position
	var vx = camera_get_view_x(view), vy = camera_get_view_y(view);
	draw_sprite_ext(spr_debug_center,0,vx,vy,2,2,0,c_green,0.75);	// Camera view's uuper left corner
	draw_rectangle_color(vx + 204,vy + 96,vx + 220,vy + 144, c_white,c_white,c_white,c_white,true);
	
	draw_line_color(v_limitleft2+1,v_limittop2,v_limitleft2+1,v_limitbtm2,c_red,c_red);
	draw_line_color(v_limitright2-1,v_limittop2,v_limitright2-1,v_limitbtm2,c_red,c_red);
}