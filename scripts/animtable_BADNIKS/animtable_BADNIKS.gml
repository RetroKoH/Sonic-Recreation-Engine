function animtable_MOTOBUG(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsMotobug;	AnimationsMotobug=ds_grid_create(2,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsMotobug; var an_id = 0;

	// #0 - Idle
	ds_grid_set(an, an_id, ANIM_NAME,			"Idle");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_motobug);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_motobug);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_motobug);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================

	an_id++;
	// #1 - Moving
	ds_grid_set(an, an_id, ANIM_NAME,			"Moving");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_motobug);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_motobug);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_motobug);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/6);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 1);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/6);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/6);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/7);
	// ==================================================================================
}

function animtable_CRABMEAT(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsCrabmeat;	AnimationsCrabmeat=ds_grid_create(3,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsCrabmeat; var an_id = 0;

	// #0 - Idle
	ds_grid_set(an, an_id, ANIM_NAME,			"Idle");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================

	an_id++;
	// #1 - Moving
	ds_grid_set(an, an_id, ANIM_NAME,			"Moving");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 1);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/16);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/16);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/16);
	// ==================================================================================

	an_id++;
	// #2 - Firing
	ds_grid_set(an, an_id, ANIM_NAME,			"Firing");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_crabmeat);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 3);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================
}

function animtable_BUZZBOMBER(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// ==================================================================================

	// Create a grid table for the animations.
	globalvar AnimationsBuzzBomber;	AnimationsBuzzBomber=ds_grid_create(3,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsBuzzBomber; var an_id = 0;

	// #0 - Idle
	ds_grid_set(an, an_id, ANIM_NAME,			"Idle");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================

	an_id++;
	// #1 - Moving
	ds_grid_set(an, an_id, ANIM_NAME,			"Moving");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1); // Will use FIRE subanimation
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================

	an_id++;
	// #2 - Firing
	ds_grid_set(an, an_id, ANIM_NAME,			"Firing");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_buzzbomber);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	2);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Exporting animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 1);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 3);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	// ==================================================================================
}