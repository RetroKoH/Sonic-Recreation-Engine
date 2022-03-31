/// @description Draw the menu options at the top
// All menu options will be handled by their own objects

draw_surface(surface_menu,0,0);
var co; if (active) co = c_lime;
else co = c_yellow;

var wid = surface_get_width(surface_menu), hgt = surface_get_height(surface_menu);
var h = draw_get_halign();
draw_set_halign(fa_center);
var f = draw_get_font();
draw_set_font(font_options);
draw_text_color(wid*((option+1)/6),hgt/3,menu_string[option],co,co,co,co,1);
draw_set_font(f);
draw_set_halign(h);