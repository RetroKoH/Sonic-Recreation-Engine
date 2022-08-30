function scr_ray_airglide(){
	scr_ray_move_glide();			// Glide movement
	if (ysp<0 && ysp>-4) xsp-=(floor(xsp / 0.125)/256);
	scr_player_level_bound();		// Interactions with camera planes
	scr_apply_speed(true);			// SpeedToPos + grav
	if (status&STA_WATER) ysp-=.15625;	// Underwater gravity
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