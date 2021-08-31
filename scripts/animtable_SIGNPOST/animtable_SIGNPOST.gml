function animtable_SIGNPOST(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsSignpost;	AnimationsSignpost=ds_grid_create(4,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsSignpost; var an_id = 0;
	var sp=1/2;

	// #0 - Eggman
	ds_grid_set(an, an_id, ANIM_NAME,			"Eggman");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_signpost);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================

	an_id++;
	// #1 - Spin Cycle #1
	ds_grid_set(an, an_id, ANIM_NAME,			"Spin #1");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_signpost);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (var i = 0; i < 4; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), sp);
	}
	// ==================================================================================

	an_id++;
	// #2 - Spin Cycle #2
	ds_grid_set(an, an_id, ANIM_NAME,			"Spin #2");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_signpost);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 4);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), sp);
	for (var i = 1; i < 4; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), sp);
	}
	// ==================================================================================

	an_id++;
	// #3 - Sonic
	ds_grid_set(an, an_id, ANIM_NAME,			"Sonic");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_signpost);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_signpost);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 4);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================
}