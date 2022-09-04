/// @description Insert description here
// You can write your code in this editor


/*
var dx = dcos(dcos(ang) * -90 + 90);
var dy = dsin(dcos(ang) * -90 + 90);
	
// Calculate final position
var px = round(base_x + dx * ($58));
var py = round(base_y + dy * ($58));
*/
var ang = (256-osc_a)*1.40625;

draw_text(2,2,osc_a);
draw_text(2,18,osc_b);
draw_text(2,34,inc);
draw_text(2,50,lim);
draw_text(2,66,pol);

draw_text(2,88,"angle "+string(round(dcos((ang+90.6)) * $88)));

var py = round(base_y + dcos((ang+90.6)) * $88);
var px = round(base_x + dsin((ang+90.6)) * $88);

draw_sprite_ext(spr_GHZSwingBridge,0,base_x,base_y+$88,1,1,0,c_white,.5);
draw_sprite(spr_GHZSwingBridge,0,px,py);