/// @description Draw out debug log
if debug{
	draw_set_alpha(0.5)
	draw_rectangle_color(0,view_hport[0]-string_height("\n\n\n")-4,view_wport[0],view_hport[0],c_black,c_black,c_black,c_black,false);
	draw_text_color(4,view_hport[0]-string_height(debuglog),debuglog,c_aqua,c_aqua,c_aqua,c_aqua,1);
	draw_set_alpha(1)
}