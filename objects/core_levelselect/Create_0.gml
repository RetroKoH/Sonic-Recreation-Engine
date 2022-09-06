/// @description Init surface

var f = draw_get_font();
draw_set_font(global.font_levsel);
surface_levsel = surface_create(424,240);
surface_set_target(surface_levsel);

for (var i = 0; i<LevSel_items.total; i++)
{
	var data = global.LevSelect_Data[i];
	draw_text(data.pos_x,data.pos_y,data.txt);
}

surface_reset_target();
draw_set_font(f);

sel_cursor = 0;
sel_char = 0;
sel_delay = 9;
sel_timer = 0;
sel_timer_2 = 0;

sel_characters = ["SONIC","TAILS","KNUCKLES","AMY","MIGHTY","RAY","METAL SONIC"];

