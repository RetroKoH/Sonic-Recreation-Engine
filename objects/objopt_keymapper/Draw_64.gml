/// @description Insert description here

if !visible exit;

draw_sprite_ext(spr_controller,option,view_wport[0]/2,view_hport[0]/3,.5,.5,0,c_white,1);

// This can all be applied to a surface
var co; co[0] = c_white; co[1] = c_yellow; co[2] = c_lime;

var f = draw_get_font();
draw_set_font(font_options);

var _x = 380;
var _x2 = 380;
var _y = 420;
var _h = 32;
var i = co[(option==1) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"D-Pad Up: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_UP]],i,i,i,i,1); _y += _h;

i = co[(option==2) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"D-Pad Down: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_DOWN]],i,i,i,i,1); _y += _h;

i = co[(option==3) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"D-Pad Left: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_LEFT]],i,i,i,i,1); _y += _h;

i = co[(option==4) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"D-Pad Right: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_RIGHT]],i,i,i,i,1); _y += _h;

i = co[(option==5) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"Button A: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_A]],i,i,i,i,1); _y += _h;

i = co[(option==6) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"Button B: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_B]],i,i,i,i,1); _y += _h;

i = co[(option==7) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"Button C: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_C]],i,i,i,i,1); _y += _h;

i = co[(option==8) ? ((active==true) ? 2 : 1) : 0];
	draw_text_color(_x,_y,"Start: ",i,i,i,i,1);
	draw_text_color(_x+_x2,_y,global._fhinputKeys[keymap_array[KEY_START]],i,i,i,i,1);

draw_set_font(f);