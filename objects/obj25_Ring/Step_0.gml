/// @description Check if Ring is collected
if fading exit;
if routine==2 // If the ring has been collected, and has entered the collected routine,
{
    routine++;				 // Set to the sparkle routine to happen next. The animation will change according to the routine.
	anim_ID++;				// Set animation
    scr_obj_priority(1);  // The drawing priority changes.
	audio_play_sound_at(sfx15_Ring,player.x+(150*global.ring),y,0,
				global.core_sound.max_dist,global.core_sound.dropoff_dist,global.core_sound.multiplier,false,1);
	global.ring*=-1;
    scr_collect_rings(1);    // Subroutine for collecting rings.
}

// routine==3 - Sparkle routine

if routine==4 // Sparkle routine, minus the collection
{
    routine--;			// Set to the sparkle routine to happen next. The animation will change according to the routine.
	anim_ID++;			// Set animation
    //scr_obj_priority(1);          // The drawing priority changes.
}