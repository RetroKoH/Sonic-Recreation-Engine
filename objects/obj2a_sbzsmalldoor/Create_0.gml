/// @description Init Platform
event_inherited();
image_speed = 0;
scr_obj_priority(4);
routine = 0;
delay = 0;		// Used for falling platforms

/* SUBTYPES
	0 - Stationary
	1 - Horizontal (Right > Left) - Osc values
	2 - Vertical (Down > Up) - Osc values
	3 - Set to fall when stood upon
	4 - Actually Falling (After stood on; This subtype is never initialized)
	5 - Horizontal (Left > Right) - Osc values
	6 - Vertical (Up > Down) - Osc values
	7 - Moves up when Switch is hit
	8 - Moves up (?)
	9 - Large
	10 ($A) - Down > Up SLOW
	11 ($B) - Up > Down SLOW