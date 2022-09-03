/// @description Init Got Through card
routine=0;
act_num=0;
act_flag = true;
timer=0;

// Position array
start_x = array_create(8, 0);
main_x = array_create(8, 0);
xpos = array_create(8, 0);
ypos = array_create(8, 0);
finished = 0; // Bitmask

char_name = global.GotCard_ConData[playermode].text;

// Create subsprites for the text
var f = draw_get_font(), a = draw_get_halign();
draw_set_font(CARDFONT); draw_set_halign(fa_left);

surf_name = surface_create(string_width(char_name),16);
surf_past = surface_create(string_width("PASSED"),16);
surface_set_target(surf_name);
draw_text(0,0,char_name);
surface_reset_target();
surface_set_target(surf_past);
draw_text(0,0,"PASSED");
surface_reset_target();

draw_set_font(f); draw_set_halign(a);