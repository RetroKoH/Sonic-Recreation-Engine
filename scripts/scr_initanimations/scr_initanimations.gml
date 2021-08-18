function scr_initanimations(table, ID){
	anim_table          = table;															// Animations Table
	anim_ID             = ID;																// Start with the ENTRY animation
	anim_prev           = -1;                                                                   // No previous animation
	anim_sprite         = ds_grid_get(anim_table,anim_ID,ANIM_SPRITE);                          // Get animation sprite index
	anim_spriteframe    = 0;                                                                    // Reset sprite frame index
	anim_mask[0]        = ds_grid_get(anim_table,anim_ID,ANIM_SPRITEMASK);                      // Get animation sprite mask
	anim_mask[1]        = ds_grid_get(anim_table,anim_ID,ANIM_SPRITEMASK_L);
	anim_frame          = 0;                                                                    // Reset animation frame
	anim_framecount     = ds_list_size(ds_grid_get(anim_table,anim_ID,ANIM_FRAMESPEEDLIST));    // Get number of frames in animation
	anim_looptimes      = ds_grid_get(anim_table,anim_ID,ANIM_LOOPBACKTIMES);                   // Get # of loopbacks in animation.
	anim_loopframe      = ds_grid_get(anim_table,anim_ID,ANIM_LOOPBACKFRAME);                   // Get the frame for the animation to loop back to.
	anim_loopanim       = ds_grid_get(anim_table,anim_ID,ANIM_LOOPBACKANIM);                    // Get the animation for the animation to loop back to.
	anim_direction      = 1;                                                                    // Direction of the animation
	anim_angle          = 0;                                                                    // Angle of the animation
	anim_xscale         = 1;                                                                    // Scale of the animation
	anim_yscale         = 1;                                                                    // Scale of the animation
	anim_speedmod       = 1;                                                                    // Speed mod factor, for running, and certain other animations.
	anim_framemod       = 0;                                                                    // General frame modifier, for certain instances such as running.
	anim_finished       = false;
	anim_reset			= true;
}