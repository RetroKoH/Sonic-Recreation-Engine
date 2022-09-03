/// @description Init Title card
routine=0;
act_num=0;
timer=0;

// Position array
start_x = array_create(4, 0);
main_x = array_create(4, 0);
xpos = array_create(4, 0);
ypos = array_create(4, 0);
finished = array_create(4, false);

if zone==ZONE_SBZ && act==3 {
	zone_name = global.TtlCard_ConData[ZONE_MGHZ+1].name;
	act_flag = false;
}
else {
	zone_name = global.TtlCard_ConData[zone].name;
	act_flag = true;
}

// Create subsprites for the text
var f = draw_get_font(), a = draw_get_halign();
draw_set_font(CARDFONT); draw_set_halign(fa_left);

surf_name = surface_create(string_width(zone_name),16);
surf_zone = surface_create(string_width("ZONE"),16);
surface_set_target(surf_name);
draw_text(0,0,zone_name);
surface_reset_target();
surface_set_target(surf_zone);
draw_text(0,0,"ZONE");
surface_reset_target();

draw_set_font(f); draw_set_halign(a);