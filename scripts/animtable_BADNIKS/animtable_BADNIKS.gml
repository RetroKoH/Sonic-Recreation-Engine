// Database of sprite animations for the crabmeat object ($1E)
function animtable_CRABMEAT(){
	global.AnimationsCrabmeat=array_create(3);

	global.AnimationsCrabmeat[0] = {
		name		: "Idle",
		sprite		: spr_crabmeat,
		mask		: spr_crabmeat,
		mask_l		: spr_crabmeat,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],	// Animation frames
		speeds		: [1]
	}
	// ==================================================================================

	var sp=1/16;
	global.AnimationsCrabmeat[1] = {
		name		: "Moving",
		sprite		: spr_crabmeat,
		mask		: spr_crabmeat,
		mask_l		: spr_crabmeat,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [ 1,  2,  0],	// Animation frames
		speeds		: [sp, sp, sp]
	}
	// ==================================================================================

	var sp=1/16;
	global.AnimationsCrabmeat[2] = {
		name		: "Firing",
		sprite		: spr_crabmeat,
		mask		: spr_crabmeat,
		mask_l		: spr_crabmeat,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [3],	// Animation frames
		speeds		: [1]
	}
	array_push(animation_index,global.AnimationsCrabmeat);
}

// Database of sprite animations for the crabmeat object ($22)
function animtable_BUZZBOMBER(){
	global.AnimationsBuzzBomber=array_create(3);

	global.AnimationsBuzzBomber[0] = {
		name		: "Idle",
		sprite		: spr_buzzbomber,
		mask		: spr_buzzbomber,
		mask_l		: spr_buzzbomber,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],	// Animation frames
		speeds		: [1]
	}
	// ==================================================================================

	global.AnimationsBuzzBomber[1] = {
		name		: "Moving",
		sprite		: spr_buzzbomber,
		mask		: spr_buzzbomber,
		mask_l		: spr_buzzbomber,
		sub_anim	: -1, // Will use FIRE subanimation
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],	// Animation frames
		speeds		: [1]
	}
	// ==================================================================================

	var sp=1/2;
	global.AnimationsBuzzBomber[2] = {
		name		: "Firing",
		sprite		: spr_buzzbomber,
		mask		: spr_buzzbomber,
		mask_l		: spr_buzzbomber,
		sub_anim	: -1, // Will use FIRE subanimation
		loop_times	: -1,
		loop_frame	: 2,
		loop_anim	: -1,
		frames		: [ 1,  2, 3],	// Animation frames
		speeds		: [sp, sp, 1]
	}
	array_push(animation_index,global.AnimationsBuzzBomber);
}

// Database of sprite animations for the motobug object ($40)
function animtable_MOTOBUG(){
	global.AnimationsMotobug=array_create(2);

	global.AnimationsMotobug[0] = {
		name		: "Idle",
		sprite		: spr_motobug,
		mask		: spr_motobug,
		mask_l		: spr_motobug,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [2],	// Animation frames
		speeds		: [1]
	}
	// ==================================================================================

	var sp=1/6;
	global.AnimationsMotobug[1] = {
		name		: "Moving",
		sprite		: spr_motobug,
		mask		: spr_motobug,
		mask_l		: spr_motobug,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [ 0,  1,  0,   2],	// Animation frames
		speeds		: [sp, sp, sp, 1/7]
	}
	array_push(animation_index,global.AnimationsMotobug);
}