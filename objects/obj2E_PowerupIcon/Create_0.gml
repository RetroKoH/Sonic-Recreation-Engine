/// @description Init Powerup Effect
// Acts similarly to the points object, except this DOES have an effect on gameplay
event_inherited();
scr_obj_OOB_settings(-1);	// This object doesn't despawn offscreen
image_speed=0;				// We don't want an animation, so this is 0.
scr_obj_priority(3);
routine=0;
ysp=-3;						// The speed that the object will move at. This will decrease over time.
