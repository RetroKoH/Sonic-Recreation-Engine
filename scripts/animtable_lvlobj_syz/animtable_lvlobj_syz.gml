function animtable_LVLOBJ_SYZ(){
	animtable_Bumper();
}

// Database of sprite animations for the SBZ electrocuter object ($6E)
function animtable_Bumper(){
	global.AnimationsBumper=array_create(2);

	global.AnimationsBumper[0] = {
		name		: "Idle",
		sprite		: spr_bumper,
		mask		: spr_bumper,
		mask_l		: spr_bumper,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0],	// Animation frames
		speeds		: [1]
	}
	// ==================================================================================

	var sp=1/4;
	global.AnimationsBumper[1] = {
		name		: "Hit",
		sprite		: spr_bumper,
		mask		: spr_bumper,
		mask_l		: spr_bumper,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: 0,
		frames		: [ 1,  2,  1,  2],	// Animation frames
		speeds		: [sp, sp, sp, sp]
	}
	array_push(animation_index,global.AnimationsBumper);
}