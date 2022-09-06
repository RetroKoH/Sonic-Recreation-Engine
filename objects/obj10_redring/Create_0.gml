/// @description Init Ring Animation
event_inherited();
scr_obj_OOB_settings(OOB_PAUSE);
scr_obj_priority(2);
routine=1;     // This notes what we should do in the Step Event code.

// Animation system related variables
scr_init_anim(global.AnimationsRings,0);