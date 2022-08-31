// Database of sprite animations for the lamppost object ($79)
function animtable_LAMPPOST(){
	global.AnimationsLamppost=array_create(3);
	var sp=1/4;

	global.AnimationsLamppost[0] = {
		name		: "Blue",
		sprite		: spr_lamppost,
		mask		: spr_lamppost,
		mask_l		: spr_lamppost,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [0]
	}
	// ==================================================================================
	global.AnimationsLamppost[1] = {
		name		: "Twirling",
		sprite		: spr_lamppost,
		mask		: spr_lamppost,
		mask_l		: spr_lamppost,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: 2,
		frames		: [],
		speeds		: []
	}
	var an = global.AnimationsLamppost[1];
	for (var i = 1; i < 16; i++){
		array_push(an.frames, i);
	    array_push(an.speeds, 1);
	}
	// ==================================================================================
	global.AnimationsLamppost[2] = {
		name		: "Red",
		sprite		: spr_lamppost,
		mask		: spr_lamppost,
		mask_l		: spr_lamppost,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [16,17],
		speeds		: [sp,sp]
	}
	// ==================================================================================
	// ==================================================================================
	array_push(animation_index,global.AnimationsLamppost);
}