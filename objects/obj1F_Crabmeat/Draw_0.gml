/// @description Draw Crabmeat

scr_render_anim(false);
event_inherited();

draw_text(x-8,y-4,sign(xsp));
draw_text(x+12,y-4,anim_direction);
