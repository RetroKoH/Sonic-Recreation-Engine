/// @description Draw out the Title Card
// {Char Name HAS}, {PASSED}, {act#}, {Blue Oval}, {SCORE}, {TIME}, {RING}, {COOL}

draw_text(2,2,"ROUTINE: "+string(routine)+"/"+string(timer));


draw_sprite_ext(spr_titleoval,0,xpos[3],ypos[3],3,3,0,c_white,1);
if (act_flag) draw_sprite_ext(spr_titleacts,act_num,xpos[2],ypos[2],3,3,0,c_white,1);
draw_surface_ext(surf_past,xpos[1],ypos[1],3,3,0,c_white,1);
draw_surface_ext(surf_name,xpos[0],ypos[0],3,3,0,c_white,1);

draw_sprite_ext(spr_GotBonus,0,xpos[4],ypos[4],3,3,0,c_white,1);
draw_sprite_ext(spr_GotBonus,1,xpos[5],ypos[5],3,3,0,c_white,1);
draw_sprite_ext(spr_GotBonus,2,xpos[6],ypos[6],3,3,0,c_white,1);
draw_sprite_ext(spr_GotBonus,3,xpos[7],ypos[7],3,3,0,c_white,1);

// Draw the text
var f = draw_get_font();
var ha = draw_get_halign();
var va = draw_get_valign();

draw_set_font(HUDFONT);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

var dist = 460;
draw_text_ext_transformed(xpos[4]+dist,ypos[4],p_score,0,56*3,3,3,0);	// Score
draw_text_ext_transformed(xpos[5]+dist,ypos[5],timebonus,0,56*3,3,3,0);	// Time Bonus
draw_text_ext_transformed(xpos[6]+dist,ypos[6],ringbonus,0,56*3,3,3,0);	// Ring Bonus
draw_text_ext_transformed(xpos[7]+dist,ypos[7],coolbonus,0,56*3,3,3,0);	// Cool Bonus

draw_set_font(f);
draw_set_halign(ha);
draw_set_valign(va);