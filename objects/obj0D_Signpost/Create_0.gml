/// @description Init Signpost
// This object will be vital, as it marks the end of the level.
event_inherited();
scr_obj_OOB_settings(OOB_PAUSE);
scr_obj_priority(4);
routine=0;          // This notes what we should do in the Step Event code.
spintime=60;        // Time for signpost to spin.
sparkletime=$B;     // Time between sparkles.
sparkleid=0;        // Counter to keep track of sparkles.

// Animation system related variables
scr_init_anim(global.AnimationsSignpost,0);