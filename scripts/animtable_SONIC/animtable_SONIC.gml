function animtable_SONIC(){
	// ==================================================================================
	// Database of sprite animations. This is what the animations engine reads from to function. Based on the one from Damizean/RogueYoshi's old Sonic engine.
	// The table has a column for every animation used. It also has a row for every piece of data needed for the animation to perform.
	// The "header" row is a string that gives a label to the animation, for debug purposes. Following that:
	// The 1st row tells the sprite that we will pull the frames from.
	// The 2nd row tells the sprite mask that will be used for the animation. This makes for dynamic collision masks based on the animation.
	// There is a duplicate row for mirrored masks
	// The 4th row tells which subanimation (if applicable) will perform along with the current animation. -1 = N/A.
	// The 5th row tells how many times the animation loops back around. The engine will count up every time it loops, so -1 is infinite. 0 = no loops.
	// The 6th row tells which frame the animation will loop to. After it finishes once, it will jump to this frame.
	// The 7th row tells which other animation (if applicable) the current one jumps to after it finishes looping. -1 = N/A.
	// The 8th row contains a list. This is a list of frames that will play in the animation, in the order that they are listed.
	// The 9th row has another list. This is a list of speed variables, telling how long one frame will be displayed.
	// This is very easy. An action in objControl's End Step event demands that when a counter reaches 1, the animation will advance 1 frame.
	// SO, to tell the engine how many steps we want a frame to last, here is the equation: (1/300) - A frame with this speed will last 300 steps.
	// ==================================================================================

	// Enums - Shared across all playable characters
	enum anim_player {
		idle,
		walk,
		jog,
		run,
		dash,
		lookup,
		duck,
		roll,
		skid,
		push,
		total // Used for final count below
	}

	// Create a grid table for the animations.
	globalvar AnimationsSonic;	AnimationsSonic=ds_grid_create(anim_player.total,10);
	// The first # is the number of animations. Change this as necessary.
	// Second # is the number of data items per animations. DON'T CHANGE THIS!

	// Local variables for simplifying porting of animations from script to script
	var an=AnimationsSonic; var an_id = 0;

	// #0 - IDLE
	ds_grid_set(an, an_id, ANIM_NAME,			"Idle");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	3);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 0); // The basic standing pose.
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/288); // Sonic will stand still for roughly 5 seconds.
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/24);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 1); // Sonic's eyes are wide open.
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/72);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 2);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/24);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 3);
	ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/24);
	// ==================================================================================

	an_id++;
	// #1 - WALK
	ds_grid_set(an, an_id, ANIM_NAME,			"Walk");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_walk);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (var i = 0; i < 12; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1)
	}
	// ==================================================================================

	an_id++;
	// #2 - JOG
	ds_grid_set(an, an_id, ANIM_NAME,			"Jog");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_jog);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 10; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1)
	}
	// ==================================================================================

	an_id++;
	// #3 - RUN
	ds_grid_set(an, an_id, ANIM_NAME,			"Run");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_run);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 8; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1)
	}
	// ==================================================================================

	an_id++;
	// #4 - DASH
	ds_grid_set(an, an_id, ANIM_NAME,			"Dash");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_dash);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 4; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1)
	}
	// ==================================================================================

	an_id++;
	// #5 - LOOK UP
	ds_grid_set(an, an_id, ANIM_NAME,			"Look Up");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_lookup);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 2; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/2)
	}
	// ==================================================================================

	an_id++;
	// #6 - DUCK
	ds_grid_set(an, an_id, ANIM_NAME,			"Duck");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_duck);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 2; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/2);
	}
	// ==================================================================================
	
	an_id++;
	// #7 - ROLL
	ds_grid_set(an, an_id, ANIM_NAME,			"Roll");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_roll);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_roll);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_roll);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 4; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 8);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), 9);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i*2);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i*2 + 1);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1);
	}
	// ==================================================================================	

	an_id++;
	// #8 - SKID
	ds_grid_set(an, an_id, ANIM_NAME,			"Skid");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_skid);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	4);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 6; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/4);
	}
	// ==================================================================================

	an_id++;
	// #8 - PUSH
	ds_grid_set(an, an_id, ANIM_NAME,			"Push");
	ds_grid_set(an, an_id, ANIM_SPRITE,			spr_sonic_push);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK,		spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SPRITEMASK_L,	spr_sonic_idle);
	ds_grid_set(an, an_id, ANIM_SUBANIM,		-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKTIMES,	-1);
	ds_grid_set(an, an_id, ANIM_LOOPBACKFRAME,	0);
	ds_grid_set(an, an_id, ANIM_LOOPBACKANIM,	-1);
	ds_grid_set(an, an_id, ANIM_FRAMELIST,		ds_list_create());
	ds_grid_set(an, an_id, ANIM_FRAMESPEEDLIST,	ds_list_create());

	// Animation frames
	for (i = 0; i < 8; i++) {
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMELIST), i);
		ds_list_add(ds_grid_get(an, an_id, ANIM_FRAMESPEEDLIST), 1/16);
	}
	// ==================================================================================	
}