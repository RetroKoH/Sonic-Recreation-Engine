/// @description Create Explosion
// This object is simply there for the effect, more than anything, and it is destroyed immediately after.
// BUT, it does do things while it is active.

image_speed=1/7;		// Set the speed to play 1 frame for 8 steps. No animation table required.
scr_obj_priority(1);
routine=0;				// This will start out at 0, but will change to 2, if needed.