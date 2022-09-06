/// @description Draw Surface
draw_text(4,4,string(sel_cursor)+"  "+string(sel_timer))

draw_surface(surface_levsel,0,0);

var h = draw_get_halign();
draw_set_halign(fa_right);
var f = draw_get_font();
draw_set_font(global.font_levsel);

draw_text(368,120,sel_characters[sel_char]);

var c = draw_get_color();
draw_set_color(c_yellow);
draw_set_halign(fa_left);
// Draw currently selected line in yellow
var data = global.LevSelect_Data[sel_cursor];
	draw_text(data.pos_x,data.pos_y,data.txt);

draw_set_color(c);
draw_set_halign(h);
draw_set_font(f);

