/// @description Init Ring Animation
// Much of the early code, involving ring grouping, has been omitted, as each ring will be placed individually, ala Sonic 3.
event_inherited();
scr_obj_priority(2);
routine	= 1;		// This notes what we should do in the Step Event code.
height=8;
col_path=0;
grv		= 0.09375;	// The force of the ring's gravity.

// Animation system related variables
scr_init_anim(global.AnimationsRings,0);