function animtable_MONITORS(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsMonitors;	AnimationsMonitors=ds_grid_create(2,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsMonitors; var an_id = 0;
	var sp=1/2;

	// #0 - Active
	ds_grid_set(an, an_id, ANIM_NAME,			"Active");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_monitor);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_monitor);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_monitor);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames: 0, 3, 3, 1, 3, 3, 2, 3, 3,
	for (var i = 0; i < 3; i++)
	{
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), sp);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 3);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/4);
	}
	// ==================================================================================

	an_id++;
	// #1 - Broken
	ds_grid_set(an, an_id, ANIM_NAME,			"Broken");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_monitor);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_monitor);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_monitor);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 4);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================
}