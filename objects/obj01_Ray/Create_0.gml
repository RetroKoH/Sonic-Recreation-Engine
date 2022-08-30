// Init character
event_inherited();
control_modes = CTRLModes_Ray;
double_jump = scr_ray_startglide;
rotation=0;
ability_speed=0;
swoop_timer=0;
dive_timer=0;
air_glide_prop_2nd=0;
ability_timer=0;


// Animation system related variables
scr_init_anim(global.AnimationsRay,0);