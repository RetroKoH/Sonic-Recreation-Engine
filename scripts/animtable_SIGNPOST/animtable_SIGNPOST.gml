// Database of sprite animations for the signpost object ($0D)
function animtable_SIGNPOST(){
	global.AnimationsSignpost=array_create(4);
	var sp = 1/2;

	global.AnimationsSignpost[0] = {
		name		: "Eggman",
		sprite		: spr_signpost,
		mask		: spr_signpost,
		mask_l		: spr_signpost,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	array_push(global.AnimationsSignpost[0].frames, 0);
	array_push(global.AnimationsSignpost[0].speeds, 1);
	// ==================================================================================

	global.AnimationsSignpost[1] = {
		name		: "Spin #1",
		sprite		: spr_signpost,
		mask		: spr_signpost,
		mask_l		: spr_signpost,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	for (var i = 0; i < 4; i++) {
		array_push(global.AnimationsSignpost[1].frames, i);
		array_push(global.AnimationsSignpost[1].speeds, sp);
	}
	// ==================================================================================

	global.AnimationsSignpost[2] = {
		name		: "Spin #2",
		sprite		: spr_signpost,
		mask		: spr_signpost,
		mask_l		: spr_signpost,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	array_push(global.AnimationsSignpost[2].frames, 4);
	array_push(global.AnimationsSignpost[2].speeds, sp);
	for (var i = 1; i < 4; i++) {
		array_push(global.AnimationsSignpost[2].frames, i);
		array_push(global.AnimationsSignpost[2].speeds, sp);
	}
	// ==================================================================================

	global.AnimationsSignpost[3] = {
		name		: "Player",
		sprite		: spr_signpost,
		mask		: spr_signpost,
		mask_l		: spr_signpost,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	array_push(global.AnimationsSignpost[3].frames, 4);
	array_push(global.AnimationsSignpost[3].speeds, 1);
}