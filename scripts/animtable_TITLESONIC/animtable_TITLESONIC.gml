function animtable_TITLESONIC(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsTitleSonic;	AnimationsTitleSonic=ds_grid_create(14,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsTitleSonic; var an_id = 0;
	var sp=1/8;

	// #0 - IDLE
	ds_grid_set(an, an_id, ANIM_NAME,			"Anim");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_title);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_title);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_title);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	16);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (var i = 0; i < 18; i++)
	{
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), sp);
	}
	// ==================================================================================
}