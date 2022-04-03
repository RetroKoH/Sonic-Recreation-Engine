// Database of sprite animations for the monitor object ($26)
function animtable_MONITORS(){
	global.AnimationsMonitors=array_create(2);
	var sp=1/2;

	global.AnimationsMonitors[0] = {
		name		: "Active",
		sprite		: spr_monitor,
		mask		: spr_monitor,
		mask_l		: spr_monitor,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0,   1,  2,   3],
		speeds		: [sp, sp, sp, 1/4]
	}
	// ==================================================================================

	global.AnimationsMonitors[1] = {
		name		: "Broken",
		sprite		: spr_monitor,
		mask		: spr_monitor,
		mask_l		: spr_monitor,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [4],
		speeds		: [1]
	}
	array_push(animation_index,global.AnimationsMonitors);
}