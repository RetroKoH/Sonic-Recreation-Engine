/// @description Check if Ring is collected
if fading exit;
if routine==2 // If the ring has been collected, and has entered the collected routine,
{
    routine++;				 // Set to the sparkle routine to happen next. The animation will change according to the routine.
	anim_ID++;				// Set animation
    //depth=1;               // The drawing priority changes.
    scr_collect_rings(1);    // Subroutine for collecting rings.
}

if routine==4 // Sparkle routine, minus the collection
{
    routine--;			// Set to the sparkle routine to happen next. The animation will change according to the routine.
	anim_ID++;			// Set animation
    //depth=1;          // The drawing priority changes.
}