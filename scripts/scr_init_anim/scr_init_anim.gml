function scr_init_anim(table, ID){
	anim_table			= table;					// Animations Table
	anim_ID				= ID;						// Start with the ENTRY animation
	scr_reset_anim();
}

function scr_reset_anim(){
	var at				= anim_table[anim_ID];
	anim_prev			= -1;						// No previous animation
	anim_sprite			= at.sprite					// Get animation sprite index
	anim_spriteframe	= 0;						// Reset sprite frame index
	anim_mask[0]		= at.mask					// Get primary sprite mask
	anim_mask[1]		= at.mask_l					// Get mirrored sprite mask
	anim_frame			= 0;						// Reset animation frame
	anim_framecount		= array_length(at.frames);	// Get number of frames in animation
	anim_looptimes		= at.loop_times				// Get # of loopbacks in animation.
	anim_loopframe		= at.loop_frame				// Get the frame for the animation to loop back to.
	anim_loopanim		= at.loop_anim				// Get the animation for the animation to loop back to.
	anim_direction		= 1;						// Direction of the animation
	anim_angle			= 0;						// Angle of the animation
	anim_xscale			= 1;						// Scale of the animation
	anim_yscale			= 1;						// Scale of the animation
	anim_speedmod		= 1;						// Speed mod factor, for running, and certain other animations.
	anim_framemod		= 0;						// General frame modifier, for certain instances such as running.
	anim_finished		= false;
	anim_reset			= true;
}