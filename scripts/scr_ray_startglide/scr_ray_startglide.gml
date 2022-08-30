// Taken from void Player_JumpAbility_Ray(void)
function scr_ray_startglide(){
		if double_jump_flag==0 && global.k_abc_p {
		double_jump_flag = 1;
		double_jump_property = 0;
		scr_ray_airglide();
	}
}
	/*
	if !double_jump_flag && global.k_abc_p {
		status&=~STA_SPIN;				// No longer in a ball
		status&=~STA_ROLLJUMP;
		double_jump_flag = true;
		var new_xsp = xsp - (xsp >> 3);
		xsp = max(new_xsp, !(status&STA_WATER) ? 3 : 1.5)*anim_direction;
		
		if ((status&STA_FACING || !(global.k_r_h)) && (!(status&STA_FACING) || !(global.k_l_h))) {
			if !(status&STA_WATER)
				swoop_timer = $100;
			anim_ID = anim_player.airup;
			rotation = 1;
			xsp/=2;
			var vel = abs(xsp);
			ability_speed = min(-((vel/2) + (vel/4) + (vel/8)), 4);
		}
		else{
			if !(status&STA_WATER)
				dive_timer = $100;
			anim_ID = anim_player.airdown;
			rotation = 0;
			ability_speed = 0;
		}
		ysp/=2;
		double_jump_property = $40;		// abilityValue = 64
		air_glide_prop_2nd = abs(xsp);	// abilityValues[0]
		ability_timer = $100;
	}
}