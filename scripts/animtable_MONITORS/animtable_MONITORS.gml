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
		frames		: [],
		speeds		: []
	}
	// Animation frames
	for (var i = 0; i < 3; i++)
	{
		array_push(global.AnimationsMonitors[0].frames, i);
		array_push(global.AnimationsMonitors[0].speeds, sp);
		array_push(global.AnimationsMonitors[0].frames, 3);
		array_push(global.AnimationsMonitors[0].speeds, 1/4);
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
		frames		: [],
		speeds		: []
	}
	// Animation frames
	array_push(global.AnimationsMonitors[1].frames, 4);
	array_push(global.AnimationsMonitors[1].speeds, 1);
	// ==================================================================================
}