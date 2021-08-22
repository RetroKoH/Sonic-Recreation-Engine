function animtable_RINGS(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsRings;	AnimationsRings=ds_grid_create(2,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsRings; var an_id = 0;
	var sp=1/4;

	// #0 - Default
	ds_grid_set(an, an_id, ANIM_NAME,			"Spinning");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_ring);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_ring);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_ring);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (var i = 0; i < 8; i++)
	{
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), sp);
	}
	// ==================================================================================

	an_id++;
	// #1 - Sparkle
	ds_grid_set(an, an_id, ANIM_NAME,			"Sparkle");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_ring);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_ring);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_ring);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 8);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/6);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 9);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/6);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 10);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/6);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 11);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/7);
	// ==================================================================================
}