/// @description Insert description here

framecount++; if framecount==$10000 framecount=0;	// Add 1 to level timer
if osc_active scr_osc_num_do();
scr_sync_anim();