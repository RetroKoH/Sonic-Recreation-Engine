/// @description Insert description here
if debug{
	draw_sprite_ext(spr_debug_center,0,x,y,2,2,0,c_white,0.75);
	var vx = camera_get_view_x(view), vy = camera_get_view_y(view);
	draw_rectangle_color(vx + 204,vy + 104,vx + 220,vy + 136, c_white,c_white,c_white,c_white,true);
}