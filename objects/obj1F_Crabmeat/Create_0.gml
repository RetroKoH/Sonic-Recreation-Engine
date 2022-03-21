/// @description Init Crabmeat
// They crawl around and shoot projectiles.
event_inherited();
height=16;
width=8;
xsp=0;
ysp=0;
status=0;
routine=0;
routine_2nd=0;
angle=0;
col_path=0;
timedelay=59;  // Time delay to start.
crabmode=0;    // Counter for certain things to happen.

// Animation system related variables
scr_init_anim(global.AnimationsCrabmeat,0);