// Taken from void Player_State_RayGlide(void)
function scr_ray_airglide(){
	scr_ray_move_glide();			// Glide movement
	scr_player_level_bound();		// Interactions with camera planes
	scr_apply_speed(false);			// SpeedToPos
	scr_player_jump_angle(angle);	// Reset angle
	scr_player_check_floor();		// Floor sensor collision check (and walls)*/
}

function scr_ray_move_glide(){
	if (global.k_abc_h){
		var xv = xsp, yv = ysp; // d1 and d0
		if (status&STA_FACING){ // gliding left
			if (global.k_r_h){ // if right is being held
				if (yv >= 1){
					if (double_jump_property){
						double_jump_property = 0;
						if (xv != 0){
							yv /= 2;
							yv++;
							yv*=-1;
						}
					}
				}
			}
			else if (global.k_l_h){ // if left is being held
				double_jump_property = 1;
			}
			// if not holding left, fallthrough
			if (double_jump_property){
				anim_ID = anim_player.airdown;
				xv -= 0.0625 * (1+!(status&STA_WATER));
				yv += 0.046875 * (1+!(status&STA_WATER));
			}
			else{
				anim_ID = anim_player.airup;
				xv += 0.0078125 * (1+!(status&STA_WATER));
				yv -= 0.0625 * (1+!(status&STA_WATER)); // These speeds need adjusting
			}
			// Fallthrough to setting speeds
			xsp = xv;
			if (xsp > -2) xsp=-2;
			ysp = yv
			if (ysp < -8) ysp=-8;
		}
		else{ // right
			if (global.k_l_h){ // if left is being held
				if (yv >= 1){
					if (double_jump_property){
						double_jump_property = 0;
						if (xv != 0){
							yv /= 2;
							yv++;
							yv*=-1;
						}
					}
				}
			}
			else if (global.k_r_h){ // if right is being held
				double_jump_property = 1;
			}
			// if not holding right, fallthrough
			if (double_jump_property){
				anim_ID = anim_player.airdown;
				xv += 0.0625 * (1+!(status&STA_WATER));
				yv += 0.046875 * (1+!(status&STA_WATER));
			}
			else{
				anim_ID = anim_player.airup;
				xv -= 0.0078125 * (1+!(status&STA_WATER));
				yv -= 0.0625 * (1+!(status&STA_WATER)); // These speeds need adjusting
			}
			// Fallthrough to setting speeds
			xsp = xv;
			if (xsp < 2) xsp=2;
			ysp = yv
			if (ysp < -8) ysp=-8;
		}
	}
	else { // If jump buttons are released
		double_jump_flag = -1;
		anim_ID = anim_player.roll;
		status|=STA_SPIN;
	}
}
/*	if (rotation == 1)
		if (double_jump_property < $70) double_jump_property+=8;
	else
		if (double_jump_property > $10) double_jump_property-=8;
	
	if (ability_speed) {
		ysp += ability_speed / 4;
		if (ysp < ability_speed) {
			ysp = ability_speed;
			ability_speed = 0;
		}
	}
	else
		ysp += cos(degtorad(double_jump_property))/8;
	
	if (ysp < -6) ysp = -6;
	
	if (rotation==1)
		if (ysp > 1)
			ysp = ysp - (ysp/4);
	
	if (ysp <= 0) {
		air_glide_prop_2nd -= 22 * sin(degtorad(80 - double_jump_property));
		if (air_glide_prop_2nd < 4) air_glide_prop_2nd=4;
	}
	else if (ysp > air_glide_prop_2nd)
		air_glide_prop_2nd = ysp - (ysp >> 6);
	
	if (xsp) {
		var ang = $50 - double_jump_property;
		if (anim_direction) {
			xsp -= 22 * sin(degtorad(ang));//>>(status&STA_WATER);
			if (xsp > -1) xsp = -1;
			if (xsp < -air_glide_prop_2nd) xsp = -air_glide_prop_2nd;
		}
		else {
			xsp += 22 * sin(degtorad(ang));//>>(status&STA_WATER);
			if (xsp < 1) xsp = 1;
			if (xsp > air_glide_prop_2nd) xsp = air_glide_prop_2nd;
		}
	}
	// Decrement control lock if it's active.
	if (move_lock) move_lock--;

	else if ((!(global.k_r_h) || double_jump_property != 16) && anim_direction == -1) {
		if (global.k_l_h && double_jump_property == 112 && rotation == 1) {
			ability_speed = 0;
			rotation = 0;
			anim_ID = anim_player.airdown;
		}
	}
	else if ((!(global.k_l_h) || double_jump_property != 16) && anim_direction == 1) {
		if (global.k_r_h && double_jump_property == 112 && rotation == 1) {
			ability_speed = 0;
			rotation = 0;
			anim_ID = anim_player.airdown;
		}
	}
	else if !(rotation) {
		rotation = 1;
		if (ysp > 2.5 || ability_timer == $100 || ((status&STA_WATER) && ysp > 1.5)) {
			var xVel = abs(xsp);
			
			ability_speed = -(ability_timer * ((xVel/2) + (xVel/4) + (xVel/8))/16);
			if (status&STA_WATER)
				ability_speed = (ability_speed >> 1) + (ability_speed >> 3);
			if (ability_timer > 16)
				ability_timer = ability_timer - 32;
			if (ability_speed < -6)
				ability_speed = -6;
		} anim_ID = anim_player.airup;
	}
	if !(status&STA_WATER) {
		if (anim_ID == anim_player.airdown) dive_timer = $100;
		if (anim_ID == anim_player.airup) swoop_timer = $100;
	}
	if (status&STA_INAIR) {
		if (abs(gsp) < 2) gsp *= 2;
		//Player_Gravity_False()
		double_jump_property=0;
	}
	else {
		if !(global.k_abc_h) || (y < v_limittop2+1) {
			anim_ID = anim_player.roll;
		}
		if (abs(xsp) < 1) {
			anim_ID = anim_player.roll;
		}
	}
	
	//if scr_player_get_ceiling_dist(0)<0
	//	ability_speed = 0;
}