// Enums shared across all playable characters
function animtable_PLAYERS(){
	enum anim_player {
		idle,
		walk,
		jog,
		run,
		dash,
		spindash,
		peelout,
		lookup,
		duck,
		roll,
		skid,
		push,
		spring,
		hurt,
		death,
		drown,
		// Unique character ability-related animations
		dropdash,
		fly,
		fly_fast,
		fly_tired,
		swim,
		swim_up,
		swim_tired,
		glide,
		fall,
		slide,
		landing,
		getup,
		climb,
		clambering,
		drilldive,
		airup,
		airdown,
		total // Used for final count below
	}
	animtable_SONIC();
	animtable_TAILS();
	animtable_KNUCKLES();
	animtable_AMY();
	animtable_MIGHTY();
	animtable_RAY();
	animtable_METAL();
}

// Database of sprite animations for the player object ($01 - Sonic) < Edit the Idle anim
function animtable_SONIC(){
	global.AnimationsSonic = array_create(anim_player.total)
	var sp = 1/24;
	
	global.AnimationsSonic[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_sonic_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 3,
		loop_anim	: -1,
		frames		: [    0,  2,  1,  1,  1,  2,  3],
		speeds		: [1/288, sp, sp, sp, sp, sp, sp]
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_sonic_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsSonic[anim_player.walk];
	for (var i = 0; i < 12; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_sonic_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.jog];
	for (i = 0; i < 10; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.run] = {
		name		: "Run",
		sprite		: spr_sonic_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_sonic_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.dash];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.spindash] = {
		name		: "Spindash",
		sprite		: spr_sonic_spindash,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.spindash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,5);
		array_push(an.speeds,1);
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.peelout] = {
		name		: "Peelout",
		sprite		: spr_sonic_peelout,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 14,
		loop_anim	: -1,
		frames		: [  0,  1,  2,  3, 4,5,6, 7,8,9,10,11,12,13,  14,15,16,17],
		speeds		: [1/6,1/4,1/2,1/2, 1,1,1, 1,1,1, 1, 1, 1, 1,   1, 1, 1, 1]
	}
	// ==================================================================================
	sp = 1/2;
	global.AnimationsSonic[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_sonic_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_sonic_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_sonic_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_sonic_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.push] = {
		name		: "Push",
		sprite		: spr_sonic_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsSonic[anim_player.spring] = {
		name		: "Spring",
		sprite		: spr_sonic_spring,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_sonic_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.death] = {
		name		: "Death",
		sprite		: spr_sonic_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_sonic_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	// ==================================================================================
	sp = 1/2;
	global.AnimationsSonic[anim_player.dropdash] = {
		name		: "Drop Dash",
		sprite		: spr_sonic_dropdash,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 2, 1, 3, 0, 4, 1, 5, 0, 6, 1],
		speeds		: [sp,sp,sp,sp,sp,sp,sp,sp,sp,sp,sp]
	}
	array_push(animation_index,global.AnimationsSonic);
}
// Database of sprite animations for the player object ($01 - Tails)
function animtable_TAILS(){
	global.AnimationsTails = array_create(anim_player.total)
	var sp = 1/8;
	
	global.AnimationsTails[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_tails_idle,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 48,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}

    // Animation frames
	var an = global.AnimationsTails[anim_player.idle];
	repeat(2) // Tails is standing and blinking.
    {
		array_push(an.frames, 0);		// The basic standing pose.
		array_push(an.speeds, 1/72);	// Tails will stand still for roughly 4 seconds. He blinks twice before waiting. (@ 1.334, 2.667)
		array_push(an.frames, 1);
		array_push(an.speeds, sp);
		array_push(an.frames, 2);
		array_push(an.speeds, sp);
    }
	array_push(an.frames, 0);
	array_push(an.speeds, 1/72);	// Tails goes back to standing for a short time, before looking at you.
	repeat(3) // 13 frames each
	{
		array_push(an.frames, 3);		// #7 - Staring at you
		array_push(an.speeds, 1/128);
		array_push(an.frames, 4);
		array_push(an.speeds, sp);
		repeat(5) // Tails is yawning.
	    {
			array_push(an.frames, 5);
			array_push(an.speeds, sp);
			array_push(an.frames, 6);
			array_push(an.speeds, sp);
		}
		array_push(an.frames, 4);
		array_push(an.speeds, sp);
	}
	array_push(an.frames, 7); // #40 - Staring at you, annoyed
	array_push(an.speeds, 1/128);
	array_push(an.frames, 8);
	array_push(an.speeds, sp);
	repeat(2) // Tails is sitting and blinking.
    {
		array_push(an.frames, 9);
		array_push(an.speeds, 1/72);
		array_push(an.frames, 10);
		array_push(an.speeds, sp);
		array_push(an.frames, 11);
		array_push(an.speeds, sp);
	}
	array_push(an.frames, 9); // #48 - Sitting bored (Loop point)
	array_push(an.speeds, 1/72);
	array_push(an.frames, 12);
	array_push(an.speeds, sp);
	repeat(5) // Tails is yawning.
	{
		array_push(an.frames, 13);
		array_push(an.speeds, sp);
		array_push(an.frames, 14);
		array_push(an.speeds, sp);
	}
	array_push(an.frames, 12);
	array_push(an.speeds, sp);
	// ==================================================================================
	global.AnimationsTails[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_tails_walk,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsTails[anim_player.walk];
	for (var i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsTails[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_tails_jog,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.jog];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsTails[anim_player.run] = {
		name		: "Run",
		sprite		: spr_tails_run,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsTails[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_tails_dash,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.dash];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsTails[anim_player.spindash] = {
		name		: "Spindash",
		sprite		: spr_tails_spindash,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.spindash];
	for (i = 0; i < 3; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsTails[anim_player.peelout] = global.AnimationsTails[anim_player.dash];
	// ==================================================================================
	var sp = 1/2;
	global.AnimationsTails[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_tails_lookup,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_tails_duck,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_tails_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.roll];
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsTails[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_tails_skid,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1/4);}
	// ==================================================================================
	global.AnimationsTails[anim_player.push] = {
		name		: "Push",
		sprite		: spr_tails_push,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsTails[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 4; i++){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsTails[anim_player.spring] = {
		name		: "Spring",
		sprite		: spr_tails_spring,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0,1],
		speeds		: [1,1]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_tails_hurt,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.death] = {
		name		: "Death",
		sprite		: spr_tails_death,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_tails_death,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.dropdash] = global.AnimationsTails[anim_player.spindash]
	// ==================================================================================
	sp = 1/2;
	global.AnimationsTails[anim_player.fly] = {
		name		: "Fly",
		sprite		: spr_tails_fly,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 1],
		speeds		: [sp,sp]
	}
	// ==================================================================================
	sp = 1/2;
	global.AnimationsTails[anim_player.fly_fast] = {
		name		: "Fly Fast",
		sprite		: spr_tails_fly,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [2, 3],
		speeds		: [sp,sp]
	}
	// ==================================================================================
	sp = 1/2;
	global.AnimationsTails[anim_player.fly_tired] = {
		name		: "Fly Fast",
		sprite		: spr_tails_fly,
		mask		: spr_tails_mask,
		mask_l		: spr_tails_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [4,5,6,7],
		speeds		: [sp,sp,sp,sp]
	}
	// ==================================================================================
	global.AnimationsTails[anim_player.swim] = global.AnimationsTails[anim_player.fly];
	global.AnimationsTails[anim_player.swim_up] = global.AnimationsTails[anim_player.fly];
	global.AnimationsTails[anim_player.swim_tired] = global.AnimationsTails[anim_player.fly_tired];
	// ==================================================================================
	array_push(animation_index,global.AnimationsTails);
}
// Database of sprite animations for the player object ($01 - Knuckles)
function animtable_KNUCKLES(){
	global.AnimationsKnuckles = array_create(anim_player.total)
	var sp = 1/18;
	
	global.AnimationsKnuckles[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_knux_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
    // Animation frames
	var an = global.AnimationsKnuckles[anim_player.idle];
	array_push(an.frames, 0);		// The basic standing pose.
	array_push(an.speeds, 1/300);	// Knuckles will stand still for roughly 5 seconds.

	repeat(9) // (18 frames) Knuckles is starting to get impatient.
	{
	    array_push(an.frames, 1); // Knuckles begins his waiting animation.
	    array_push(an.speeds, sp);
	    array_push(an.frames, 2); // Knuckles feet are raised.
	    array_push(an.speeds, sp);
	}
	sp = 1/6;
	array_push(an.frames, 3); // Knuckles stares at the screen.
	array_push(an.speeds, 1/30);
	array_push(an.frames, 4); // Knuckles lifts his fists.
	array_push(an.speeds, sp);

	repeat(8) // (32 frames) Knuckles' fighting stance.
	{
	    array_push(an.frames, 5);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 6);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 7);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 8);
	    array_push(an.speeds, sp);
	}
	repeat(2) // (32 frames) Knuckles' left hand punch.
	{
	    array_push(an.frames, 9);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 10);
	    array_push(an.speeds, sp);
	}

	array_push(an.frames, 11);
	array_push(an.speeds, 1/12);
	array_push(an.frames, 5);
	array_push(an.speeds, sp);
	array_push(an.frames, 4); // Knuckles lowers his fists.
	array_push(an.speeds, sp);
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_knux_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsKnuckles[anim_player.walk];
	for (var i = 0; i < 12; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_knux_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.jog];
	for (i = 0; i < 9; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.run] = {
		name		: "Run",
		sprite		: spr_knux_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_knux_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.dash];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.spindash] = {
		name		: "Spindash",
		sprite		: spr_knux_spindash,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.spindash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,5);
		array_push(an.speeds,1);
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	var sp = 1/2;
	global.AnimationsKnuckles[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_knux_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_knux_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_knux_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_knux_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 5; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.push] = {
		name		: "Push",
		sprite		: spr_knux_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsKnuckles[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 4; i++){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.spring] = {
		name		: "Spring",
		sprite		: spr_knux_spring,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_knux_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.death] = {
		name		: "Death",
		sprite		: spr_knux_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_knux_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.glide] = {
		name		: "Glide",
		sprite		: spr_knux_hover,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	sp=1/4;
	global.AnimationsKnuckles[anim_player.fall] = {
		name		: "Fall",
		sprite		: spr_knux_fall,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [0,1],
		speeds		: [sp,sp]
	}
	// ==================================================================================
	sp=1/4;
	global.AnimationsKnuckles[anim_player.slide] = {
		name		: "Slide",
		sprite		: spr_knux_slide,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0], // Use framemod when we are supposed to get up
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.landing] = {
		name		: "Land from Glide",
		sprite		: spr_knux_duck,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.getup] = {
		name		: "Get Up",
		sprite		: spr_knux_landing,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [2],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsKnuckles[anim_player.climb] = {
		name		: "Climb",
		sprite		: spr_knux_climb,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	sp = 1/6;
	global.AnimationsKnuckles[anim_player.clambering] = {
		name		: "Clamber Up",
		sprite		: spr_knux_landing,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_maskL,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0,  1, 2],
		speeds		: [sp,sp,sp]
	}
	array_push(animation_index,global.AnimationsKnuckles);
}
// Database of sprite animations for the player object ($01 - Amy)
function animtable_AMY(){
	global.AnimationsAmy = array_create(anim_player.total)
	var sp = 1/12;
	
	global.AnimationsAmy[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_amy_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	:  2,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
    // Animation frames
	var an = global.AnimationsAmy[anim_player.idle];
	array_push(an.frames, 0);		// The basic standing pose.
	array_push(an.speeds, 1/300);	// Amy will stand still for roughly 5 seconds.
	array_push(an.frames, 1);		// Amy is getting impatient.
	array_push(an.speeds, 1/6);
	repeat(3) // (12 frames) Amy's waiting pose.
	{
	    array_push(an.frames, 2);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 3);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 4);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 5);
	    array_push(an.speeds, sp);
	}
	array_push(an.frames, 5); // Stares at the screen.
	array_push(an.speeds, 1/40);

	// ==================================================================================
	global.AnimationsAmy[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_amy_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsAmy[anim_player.walk];
	for (var i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsAmy[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_amy_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsAmy[anim_player.jog];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsAmy[anim_player.run] = {
		name		: "Run",
		sprite		: spr_amy_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsAmy[anim_player.run];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsAmy[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_amy_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsAmy[anim_player.dash];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	var sp = 1/2;
	global.AnimationsAmy[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_amy_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsAmy[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_amy_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsAmy[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_amy_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsAmy[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsAmy[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_amy_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 3,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsAmy[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 3; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsAmy[anim_player.push] = {
		name		: "Push",
		sprite		: spr_amy_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsAmy[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 4; i++){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsAmy[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_amy_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsAmy[anim_player.death] = {
		name		: "Death",
		sprite		: spr_amy_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsAmy[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_amy_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	array_push(animation_index,global.AnimationsAmy);
}
// Database of sprite animations for the player object ($01 - Mighty)
function animtable_MIGHTY(){
	global.AnimationsMighty = array_create(anim_player.total)
	var sp = 1/12;
	
	global.AnimationsMighty[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_mighty_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	:  0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
    // Animation frames
	var an = global.AnimationsMighty[anim_player.idle];
	array_push(an.frames, 0);		// The basic standing pose.
	array_push(an.speeds, 1/300);	// Mighty will stand still for roughly 5 seconds.
	array_push(an.frames, 1);		// Mighty is getting impatient.
	array_push(an.speeds, 1/8);
	array_push(an.frames, 2);		// Mighty is getting impatient.
	array_push(an.speeds, 1/8);
	repeat(6) // (12 frames) Mighty's waiting pose.
	{
	    array_push(an.frames, 3);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 4);
	    array_push(an.speeds, sp);
	}
	array_push(an.frames, 5); // Stares at the screen.
	array_push(an.speeds, 1/6);

	// ==================================================================================
	global.AnimationsMighty[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_mighty_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsMighty[anim_player.walk];
	for (var i = 0; i < 12; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_mighty_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.jog];
	for (i = 0; i < 10; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.run] = {
		name		: "Run",
		sprite		: spr_mighty_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_mighty_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.dash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.spindash] = {
		name		: "Spindash",
		sprite		: spr_mighty_spindash,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.spindash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,5);
		array_push(an.speeds,1);
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	var sp = 1/2;
	global.AnimationsMighty[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_mighty_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsMighty[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_mighty_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsMighty[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_mighty_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_mighty_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.push] = {
		name		: "Push",
		sprite		: spr_mighty_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 8; i++){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsMighty[anim_player.spring] = {
		name		: "Spring",
		sprite		: spr_mighty_spring,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMighty[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_mighty_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMighty[anim_player.death] = {
		name		: "Death",
		sprite		: spr_mighty_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMighty[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_mighty_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMighty[anim_player.drilldive] = {
		name		: "Drill Dive",
		sprite		: spr_mighty_drilldive,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMighty[anim_player.drilldive];
	for (i = 0; i < 8; i++){
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	array_push(animation_index,global.AnimationsMighty);
}
// Database of sprite animations for the player object ($01 - Ray)
function animtable_RAY(){
	global.AnimationsRay = array_create(anim_player.total)
	var sp = 1/12;
	
	global.AnimationsRay[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_ray_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	:  0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
    // Animation frames
	var an = global.AnimationsRay[anim_player.idle];
	array_push(an.frames, 0);		// The basic standing pose.
	array_push(an.speeds, 1/300);	// Mighty will stand still for roughly 5 seconds.
	array_push(an.frames, 1);		// Mighty is getting impatient.
	array_push(an.speeds, 1/8);
	array_push(an.frames, 2);		// Mighty is getting impatient.
	array_push(an.speeds, 1/8);
	repeat(6) // (12 frames) Mighty's waiting pose.
	{
	    array_push(an.frames, 3);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 4);
	    array_push(an.speeds, sp);
	}
	array_push(an.frames, 5); // Stares at the screen.
	array_push(an.speeds, 1/6);

	// ==================================================================================
	global.AnimationsRay[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_ray_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsRay[anim_player.walk];
	for (var i = 0; i < 12; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsRay[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_ray_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.jog];
	for (i = 0; i < 10; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsRay[anim_player.run] = {
		name		: "Run",
		sprite		: spr_ray_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsRay[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_ray_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.dash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsRay[anim_player.spindash] = {
		name		: "Spindash",
		sprite		: spr_ray_spindash,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.spindash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,5);
		array_push(an.speeds,1);
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	var sp = 1/2;
	global.AnimationsRay[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_ray_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_ray_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_ray_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsRay[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_ray_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsRay[anim_player.push] = {
		name		: "Push",
		sprite		: spr_ray_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsRay[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 8; i++){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsRay[anim_player.spring] = {
		name		: "Spring",
		sprite		: spr_ray_spring,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_ray_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.death] = {
		name		: "Death",
		sprite		: spr_ray_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_ray_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.airup] = {
		name		: "Air Glide Up",
		sprite		: spr_ray_airglide,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_mask,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsRay[anim_player.airdown] = {
		name		: "Air Glide Down",
		sprite		: spr_ray_airglide,
		mask		: spr_glide_mask,
		mask_l		: spr_glide_mask,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [3],
		speeds		: [1]
	}
	array_push(animation_index,global.AnimationsRay);
}
// Database of sprite animations for the player object ($01 - Metal)
function animtable_METAL(){
	global.AnimationsMetal = array_create(anim_player.total)
	var sp = 1/12;
	
	global.AnimationsMetal[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_metal_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	:  0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
    // Animation frames
	var an = global.AnimationsMetal[anim_player.idle];
	array_push(an.frames, 0);		// The basic standing pose.
	array_push(an.speeds, 1/300);	// Mighty will stand still for roughly 5 seconds.
	array_push(an.frames, 1);		// Mighty is getting impatient.
	array_push(an.speeds, 1/8);
	array_push(an.frames, 2);		// Mighty is getting impatient.
	array_push(an.speeds, 1/8);
	repeat(6) // (12 frames) Mighty's waiting pose.
	{
	    array_push(an.frames, 3);
	    array_push(an.speeds, sp);
	    array_push(an.frames, 4);
	    array_push(an.speeds, sp);
	}
	array_push(an.frames, 5); // Stares at the screen.
	array_push(an.speeds, 1/6);

	// ==================================================================================
	global.AnimationsMetal[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_metal_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsMetal[anim_player.walk];
	for (var i = 0; i < 12; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMetal[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_metal_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMetal[anim_player.jog];
	for (i = 0; i < 10; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMetal[anim_player.run] = {
		name		: "Run",
		sprite		: spr_metal_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMetal[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMetal[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_metal_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMetal[anim_player.dash];
	for (i = 0; i < 5; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);}
	// ==================================================================================
	// See below for Spindash reference
	global.AnimationsMetal[anim_player.peelout] = global.AnimationsMetal[anim_player.dash];
	// ==================================================================================
	var sp = 1/2;
	global.AnimationsMetal[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_metal_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsMetal[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_metal_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [ 0,  1],
		speeds		: [sp, sp]
	}
	// ==================================================================================
	global.AnimationsMetal[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_metal_roll,
		mask		: spr_spin_mask,
		mask_l		: spr_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMetal[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);}
	// ==================================================================================
	global.AnimationsMetal[anim_player.spindash] = global.AnimationsMetal[anim_player.roll];
	// ==================================================================================
	global.AnimationsMetal[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_metal_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMetal[anim_player.skid];
	sp = 1/4;
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsMetal[anim_player.push] = {
		name		: "Push",
		sprite		: spr_metal_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsMetal[anim_player.push];
	sp = 1/16;
	for (i = 0; i < 8; i++){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsMetal[anim_player.spring] = {
		name		: "Spring",
		sprite		: spr_metal_spring,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMetal[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_metal_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMetal[anim_player.death] = {
		name		: "Death",
		sprite		: spr_metal_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================
	global.AnimationsMetal[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_metal_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1],
		speeds		: [1]
	}
	array_push(animation_index,global.AnimationsMetal);
}