/// @description Init Lamppost
event_inherited();
image_speed=0;
scr_obj_OOB_settings(OOB_PAUSE);
scr_obj_priority(5);
routine=0;          // This notes what we should do in the Step Event code.
subtype=0;

// Animation system related variables
scr_init_anim(global.AnimationsLamppost,0);