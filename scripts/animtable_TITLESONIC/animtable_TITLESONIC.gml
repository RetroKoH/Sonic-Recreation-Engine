// Database of sprite animations for the title screen object ($0E)
function animtable_TITLESONIC(){
	global.AnimationsTitleSonic = array_create(1);
	
	global.AnimationsTitleSonic[0] = {
		name		: "Anim",
		sprite		: spr_title,
		mask		: spr_title,
		mask_l		: spr_title,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 16,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	for (var i = 0; i < 18; i++)
		array_push(global.AnimationsTitleSonic[0].frames,i);
	for (i = 0; i < 10; i++)
		array_push(global.AnimationsTitleSonic[0].speeds,1/2);
	for (i = 10; i < 18; i++)
		array_push(global.AnimationsTitleSonic[0].speeds,1/8);
	array_push(animation_index,global.AnimationsTitleSonic);
}