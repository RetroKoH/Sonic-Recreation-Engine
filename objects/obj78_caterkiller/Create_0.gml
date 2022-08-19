/// @description Init Crabmeat
// They crawl around and shoot projectiles.
event_inherited();
depth=3;
height=16;
width=8;
status=0;
routine_2nd=0;
angle=0;
col_path=0;
timedelay=59;  // Time delay to start.
crabmode=0;    // Counter for certain things to happen.

// Animation system related variables
scr_init_anim(global.AnimationsCrabmeat,0);