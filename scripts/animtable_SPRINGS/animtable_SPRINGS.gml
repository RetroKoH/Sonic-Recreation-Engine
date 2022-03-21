// Database of sprite animations for the spring object ($41)
function animtable_SPRINGS(){
	global.AnimationsSprings=array_create(2);

	global.AnimationsSprings[0] = {
		name		: "Stationary",
		sprite		: spr_spring,
		mask		: spr_spring,
		mask_l		: spr_spring,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	array_push(global.AnimationsSprings[0].frames,0);
	array_push(global.AnimationsSprings[0].speeds,1);
	// ==================================================================================

	global.AnimationsSprings[1] = {
		name		: "Springing",
		sprite		: spr_spring,
		mask		: spr_spring,
		mask_l		: spr_spring,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	var an = global.AnimationsSprings[1];
	array_push(an.frames,1);
	array_push(an.speeds,1);
	array_push(an.frames,0);
	array_push(an.speeds,1/2);
	array_push(an.frames,2);
	array_push(an.speeds,1/6);
	array_push(an.frames,0);
	array_push(an.speeds,1);
}