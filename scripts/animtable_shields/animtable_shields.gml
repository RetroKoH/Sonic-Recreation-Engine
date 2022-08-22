// Enums shared across all playable characters
function animtable_SHIELDS(){
	enum anim_shield {
		shield,		// Blue Shield
		stars_1,	// Invinc Stars 1
		stars_2,	// Invinc Stars 2
		stars_3,	// Invinc Stars 3
		stars_4,	// Invinc Stars 4
		shield_f,	// Flame Shield
		shield_f2,	// Flame Dash
		shield_f3,	// Flame Shield Dissipate (in water)
		shield_b,	// Bubble Shield
		shield_b2,	// Bubble Bounce (Called by Double Jump)
		shield_b3,	// Bubble Bounce Up (Called by Reset on Floor)
		shield_l,	// Lightning Shield
		shield_l2,	// Used by sparks
		super_star,	// Super Sonic Stars
		insta,		// Instashield
		total		// Used for final count below
	}

	global.AnimationsShield = array_create(anim_shield.total)
	var i, an, sp = 1/2;
	
	global.AnimationsShield[anim_shield.shield] = {
		name		: "Blue Shield",
		sprite		: spr_shield,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [1,   4,  2,  4,  3,  4],
		speeds		: [sp, sp, sp, sp, sp, sp]
	}
	// ==================================================================================
	sp = 1/6;
	global.AnimationsShield[anim_shield.stars_1] = {
		name		: "Stars 1",
		sprite		: spr_invincibility,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [ 0,  1,  2,  3],
		speeds		: [sp, sp, sp, sp]
	}
	// ==================================================================================
	global.AnimationsShield[anim_shield.stars_2] = {
		name		: "Stars 2",
		sprite		: spr_invincibility,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 0, 4, 0, 0, 4, 1, 1, 4, 1, 1, 4, 2, 2, 4, 2, 2, 4, 3, 3, 4, 3, 3, 4],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.stars_2];
	repeat(24)
		array_push(an.speeds,1);
	// ==================================================================================
	global.AnimationsShield[anim_shield.stars_3] = {
		name		: "Stars 3",
		sprite		: spr_invincibility,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 0, 4, 0, 4, 4, 1, 1, 4, 1, 4, 4, 2, 2, 4, 2, 4, 4, 3, 3, 4, 3, 4, 4],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.stars_3];
	repeat(24)
		array_push(an.speeds,1);
	// ==================================================================================
	global.AnimationsShield[anim_shield.stars_4] = {
		name		: "Stars 4",
		sprite		: spr_invincibility,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 4, 4, 0, 4, 4, 1, 4, 4, 1, 4, 4, 2, 4, 4, 2, 4, 4, 3, 4, 4, 3, 4, 4],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.stars_4];
	repeat(24)
		array_push(an.speeds,1);
	// ==================================================================================
	sp = 1/2;
	global.AnimationsShield[anim_shield.shield_f] = {
		name		: "Flame Shield",
		sprite		: spr_shield_f,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.shield_f];
	for (i = 0; i < 18; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsShield[anim_shield.shield_f2] = {
		name		: "Flame Dash",
		sprite		: spr_shield_f,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: anim_shield.shield_f,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.shield_f2];
	for (i = 0; i < 18; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsShield[anim_shield.shield_f3] = {
		name		: "Flames Dissipate",
		sprite		: spr_shield_fsmoke,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.shield_f2];
	for (i = 0; i < 4; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsShield[anim_shield.shield_b] = {
		name		: "Bubble Shield",
		sprite		: spr_shield_b,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.shield_b];
	for (i = 0; i < 9; i++) {
		repeat(3) {
			array_push(an.frames,i);
			array_push(an.speeds,sp);
			var a = 9+(i&1);
			array_push(an.frames,a);
			array_push(an.speeds,sp);
		}
	}
	// ==================================================================================
	sp = 1/6;
	global.AnimationsShield[anim_shield.shield_b2] = {
		name		: "Bubble Bounce (Air)",
		sprite		: spr_shield_b,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: anim_shield.shield_b,
		frames		: [9, 11, 11, 11],
		speeds		: [sp, sp, sp, sp]
	}
	// ==================================================================================
	global.AnimationsShield[anim_shield.shield_b3] = {
		name		: "Bubble Bounce (Ground)",
		sprite		: spr_shield_b,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: anim_shield.shield_b,
		frames		: [12, 12, 11],
		speeds		: [sp, sp, sp]
	}
	// ==================================================================================
	sp = 1/2;
	global.AnimationsShield[anim_shield.shield_l] = {
		name		: "Lightning Shield",
		sprite		: spr_shield_l,
		mask		: spr_shield,
		mask_l		: spr_shield,
		sub_anim	: -1,
		loop_times	: -1,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.shield_l];
	for (i = 0; i < 9; i++) {
		repeat(2){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}}
	for (i = 9; i <= $B; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	for (i = $16; i > $D; i--) {
		repeat(2){
		array_push(an.frames,i);
		array_push(an.speeds,sp);}}
	for (i = 9; i <= $B; i++) {
		array_push(an.frames,i);
		array_push(an.speeds,sp);}
	// ==================================================================================
	global.AnimationsShield[anim_shield.shield_l2] = {
		name		: "Lightning Spark",
		sprite		: spr_shield_lspark,
		mask		: spr_shield_lspark,
		mask_l		: spr_shield_lspark,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [],
		speeds		: []
	}
	// Animation frames
	an = global.AnimationsShield[anim_shield.shield_l2];
	repeat(6){
		array_push(an.frames,0);
		array_push(an.speeds,1);
		array_push(an.frames,1);
		array_push(an.speeds,1);
		array_push(an.frames,2);
		array_push(an.speeds,1);}
	array_push(an.frames,0);
	array_push(an.speeds,1);
	array_push(an.frames,1);
	array_push(an.speeds,1);
	// ==================================================================================
	sp = 1/4;
	global.AnimationsShield[anim_shield.super_star] = {
		name		: "Super Star",
		sprite		: spr_superstar,
		mask		: spr_superstar,
		mask_l		: spr_superstar,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 1, 2],
		speeds		: [sp, sp, sp]
	}
	// ==================================================================================
	global.AnimationsShield[anim_shield.insta] = {
		name		: "Instashield",
		sprite		: spr_instashield,
		mask		: spr_instashield,
		mask_l		: spr_instashield,
		sub_anim	: -1,
		loop_times	: 0,
		loop_frame	: 0,
		loop_anim	: -1,
		frames		: [0, 1, 2, 3, 4, 5, 6, 6, 6, 6, 6, 6, 6, 7],
		speeds		: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
	}
	array_push(animation_index,global.AnimationsShield);
}

