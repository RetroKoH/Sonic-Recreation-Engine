// Database of sprite animations for the spring object ($41)
function animtable_SPRINGS(){
	global.AnimationsSprings=array_create(2);

	global.AnimationsSprings[0] = {
		name		: "Stationary",
		sprite		: spr_spring_yellow,
		mask		: spr_spring_yellow,
		mask_l		: spr_spring_yellow,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],
		speeds		: [1]
	}
	// ==================================================================================

	global.AnimationsSprings[1] = {
		name		: "Springing",
		sprite		: spr_spring_yellow,
		mask		: spr_spring_yellow,
		mask_l		: spr_spring_yellow,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1,   0,   2, 0],
		speeds		: [1, 1/2, 1/6, 1]
	}
	array_push(animation_index,global.AnimationsSprings);
}