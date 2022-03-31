/// @description Surface check
if !surface_exists(surface_menu) {
	var h = draw_get_halign();
	draw_set_halign(fa_center);
	var f = draw_get_font();
	draw_set_font(font_options);

	var wid = view_wport[0], hgt = string_height("\n\n");
	surface_menu=surface_create(wid,hgt);
	surface_set_target(surface_menu);
	draw_set_alpha(0.5);
	draw_rectangle_color(0,0,wid,hgt,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	for (var i = 0; i < 5; i++)
		draw_text_color(wid*((i+1)/6),hgt/3,menu_string[i],c_white,c_white,c_white,c_white,1);
	surface_reset_target();

	draw_set_font(f);
	draw_set_halign(h);
}