/// @description Init Debug Menu
menu_string[0] ="Controls";
menu_string[1] ="Animations";
menu_string[2] ="Chunks";
menu_string[3] ="Solidity";
menu_string[4] ="Sound Test";
option = 0;
active = false;

objopt[0] = instance_create_layer(0,0,"Core",objopt_keymapper);
objopt[1] = instance_create_layer(0,0,"Core",objopt_animviewer);
objopt[2] = instance_create_layer(0,0,"Core",objopt_chunkviewer);
objopt[3] = instance_create_layer(0,0,"Core",objopt_solidviewer);
objopt[4] = instance_create_layer(0,0,"Core",objopt_soundtest);

objopt[option].visible = true;

var h = draw_get_halign();
draw_set_halign(fa_center);
var f = draw_get_font();
draw_set_font(font_options);

var wid = view_wport[0], hgt = string_height("\n\n");
surface_menu = surface_create(wid,hgt);
surface_set_target(surface_menu);
draw_set_alpha(0.5);
draw_rectangle_color(0,0,wid,hgt,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1);
for (var i = 0; i < 5; i++)
	draw_text_color(wid*((i+1)/6),hgt/3,menu_string[i],c_white,c_white,c_white,c_white,1);
surface_reset_target();

draw_set_font(f);
draw_set_halign(h);