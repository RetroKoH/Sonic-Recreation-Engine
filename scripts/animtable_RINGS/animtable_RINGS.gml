// Database of sprite animations for the ring object ($25)
function animtable_RINGS(){
	global.AnimationsRings=array_create(2);

	var sp=1/4;
	global.AnimationsRings[0] = {
		name		: "Spinning",
		sprite		: spr_ring,
		mask		: spr_ring,
		mask_l		: spr_ring,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	for (var i = 0; i < 8; i++)
	{
		array_push(global.AnimationsRings[0].frames, i);
		array_push(global.AnimationsRings[0].speeds, sp);
	}
	// ==================================================================================

	var sp=1/6;
	global.AnimationsRings[1] = {
		name		: "Sparkle",
		sprite		: spr_ring,
		mask		: spr_ring,
		mask_l		: spr_ring,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [8,   9, 10,  11],
		speeds		: [sp, sp, sp, 1/7]
	}
	array_push(animation_index,global.AnimationsRings);
}