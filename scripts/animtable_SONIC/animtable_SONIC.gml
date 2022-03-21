// Enums shared across all playable characters
enum anim_player {
	idle,
	walk,
	jog,
	run,
	dash,
	lookup,
	duck,
	roll,
	skid,
	push,
	hurt,
	death,
	drown,
	total // Used for final count below
}

// Database of sprite animations for the player object ($01 - Sonic)
function animtable_SONIC(){
	global.AnimationsSonic = array_create(anim_player.total)
	var an;
	
	global.AnimationsSonic[anim_player.idle] = {
		name		: "Idle",
		sprite		: spr_sonic_idle,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 3,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.idle];
	array_push(an.frames,0);
	array_push(an.speeds,1/288);
	array_push(an.frames,2);
	array_push(an.speeds,1/24);
	array_push(an.frames,1);
	array_push(an.speeds,1/72);
	array_push(an.frames,2);
	array_push(an.speeds,1/24);
	array_push(an.frames,3);
	array_push(an.speeds,1/24);
	// ==================================================================================
	global.AnimationsSonic[anim_player.walk] = {
		name		: "Walk",
		sprite		: spr_sonic_walk,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.walk];
	for (var i = 0; i < 12; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.jog] = {
		name		: "Jog",
		sprite		: spr_sonic_jog,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.jog];
	for (i = 0; i < 10; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.run] = {
		name		: "Run",
		sprite		: spr_sonic_run,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.run];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.dash] = {
		name		: "Dash",
		sprite		: spr_sonic_dash,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.dash];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.lookup] = {
		name		: "Look Up",
		sprite		: spr_sonic_lookup,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.lookup];
	for (i = 0; i < 2; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1/2);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.duck] = {
		name		: "Duck",
		sprite		: spr_sonic_duck,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 1,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.duck];
	for (i = 0; i < 2; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1/2);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.roll] = {
		name		: "Roll",
		sprite		: spr_sonic_roll,
		mask		: spr_sonic_spin_mask,
		mask_l		: spr_sonic_spin_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.roll];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,8);
		array_push(an.speeds,1);
		array_push(an.frames,9);
		array_push(an.speeds,1);
		array_push(an.frames,i*2);
		array_push(an.speeds,1);
		array_push(an.frames,i*2 + 1);
		array_push(an.speeds,1);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.skid] = {
		name		: "Skid",
		sprite		: spr_sonic_skid,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 4,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.skid];
	for (i = 0; i < 6; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1/4);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.push] = {
		name		: "Push",
		sprite		: spr_sonic_push,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.push];
	for (i = 0; i < 8; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,1/16);
	}
	// ==================================================================================
	global.AnimationsSonic[anim_player.hurt] = {
		name		: "Hurt",
		sprite		: spr_sonic_hurt,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.hurt];
	array_push(an.frames,0);
	array_push(an.speeds,1);
	// ==================================================================================
	global.AnimationsSonic[anim_player.death] = {
		name		: "Death",
		sprite		: spr_sonic_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.death];
	array_push(an.frames,0);
	array_push(an.speeds,1);
	// ==================================================================================
	global.AnimationsSonic[anim_player.drown] = {
		name		: "Drown",
		sprite		: spr_sonic_death,
		mask		: spr_sonic_mask,
		mask_l		: spr_sonic_maskL,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsSonic[anim_player.drown];
	array_push(an.frames,1);
	array_push(an.speeds,1);
}