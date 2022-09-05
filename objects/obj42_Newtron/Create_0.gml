/// @description Init Newtron
event_inherited();
scr_obj_priority(4);
xsp=0;
ysp=0;
height=$10;
subtype=0;
can_hit = false;
can_harm = false;
has_fired = false;

// Animation system related variables
scr_init_anim(global.AnimationsNewtron,0);