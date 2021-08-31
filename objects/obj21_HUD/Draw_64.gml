/// @description Draw out the HUD
// SCORE, TIME, RINGS

draw_sprite_ext(spr_HUD,0,16*3,8*3,3,3,0,c_white,1);	// SCORE
draw_sprite_ext(spr_HUD,1,16*3,24*3,3,3,0,c_white,1);	// TIME
draw_sprite_ext(spr_HUD,2,16*3,40*3,3,3,0,c_white,1);	// RINGS

// Draw the text
var f = draw_get_font();
var ha = draw_get_halign();
var va = draw_get_valign();

draw_set_font(HUDFONT);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

draw_text_ext_transformed(112*3,8*3,p_score,0,56*3,3,3,0);	// Score
draw_text_ext_transformed(112*3,24*3,string(p_timeminutes)+":"+scr_number_lead_zero(p_timeseconds,2),0,56*3,3,3,0);	// Time
draw_text_ext_transformed(112*3,40*3,p_rings,0,56*3,3,3,0);	// Rings

draw_set_font(f);
draw_set_halign(ha);
draw_set_valign(va);