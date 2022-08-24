function animtable_LVLOBJ_SBZ(){
	animtable_SBZElectrocuter();
}

// Database of sprite animations for the SBZ electrocuter object ($6E)
function animtable_SBZElectrocuter(){
	global.AnimationsElectrocuter=array_create(2);

	global.AnimationsElectrocuter[0] = {
		name		: "Idle",
		sprite		: spr_SBZElectrocuter,
		mask		: spr_SBZElectrocuter,
		mask_l		: spr_SBZElectrocuter,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],	// Animation frames
		speeds		: [1]
	}
	// ==================================================================================

	var sp=1/3;
	global.AnimationsElectrocuter[1] = {
		name		: "Zap",
		sprite		: spr_SBZElectrocuter,
		mask		: spr_SBZElectrocuter,
		mask_l		: spr_SBZElectrocuter,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: 0,
		frames		: [ 1,  2,   3,  4,  5],	// Animation frames
		speeds		: [sp,  1, 1/2, sp, sp]
	}
	array_push(animation_index,global.AnimationsElectrocuter);
}