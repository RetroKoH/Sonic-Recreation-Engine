/// @description Animation Handling

if fading exit;

// Perform a value check. If number is outside the range of available animations, set ID to -1 and exit.
if (anim_ID == -1) exit;

if (anim_prev != anim_ID)
{
    anim_prev = anim_ID
    
	// Get information on current active animation. (Only perform on new animation).
	var at			= anim_table[anim_ID];
	anim_sprite		= at.sprite					// Get animation sprite index
	anim_mask[0]	= at.mask					// Get collision sprite mask
	anim_mask[1]	= at.mask_l					// Get mirrored collision sprite mask
	anim_frame		= 0;						// Reset animation frame
	anim_framecount	= array_length(at.frames);	// Get number of frames in animation
	anim_looptimes	= at.loop_times				// Get # of loopbacks in animation.
	anim_loopframe	= at.loop_frame				// Get the frame for the animation to loop back to.
	anim_loopanim	= at.loop_anim				// Get the animation for the animation to loop back to.
	anim_finished	= false;
}

// ===== Animation System =====
// If the animation finished, or char is dead, no need to go through all this again.
if (anim_finished) exit;

// Otherwise, proceed. Show the frame based on the animation. If we reach the end
// of the animation, check for a loop or linked animation, etc.

// Advance anim_frame by animation frame speed (Only if able to).
if (floor(anim_frame) < anim_framecount)
	anim_frame += anim_table[anim_ID].speeds[floor(anim_frame)]*anim_speedmod;
// The added check prevents bugs due to anim_frame being too high when jumping to linked animations.

// If we have reached the total number of frames...
if (floor(anim_frame) >= anim_framecount)
{
    // Loop back to loop frame while we can repeat.
    if (anim_looptimes != 0)
    {
        anim_frame = anim_loopframe;
		if (!PSB) PSB = true
        if (anim_looptimes > 0) anim_looptimes--; // -1 = the loop is infinite.
    }
    else
    {
        // The animation ends here. Change animation to the next linked one if such one exists.
        // If not, simply set AnimationFinished on.
        anim_frame             = anim_framecount-1;
        anim_finished          = true;
        if (anim_loopanim!=-1) anim_ID=anim_loopanim;
        exit;
    }
}

// Get sprite frame ID to draw, based on current animation frame.
anim_spriteframe = anim_table[anim_ID].frames[floor(anim_frame)]+anim_framemod;

// Store last used animation for next step's Animation handling.
anim_prev = anim_ID;
