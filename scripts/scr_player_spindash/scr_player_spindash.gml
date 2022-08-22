function scr_player_spindash(){
	if !spindash_flag {
		if anim_ID == anim_player.duck {
			if global.k_abc_p {
				// Initialize Spindash
				anim_ID = anim_player.spindash;
				// Play spindash sound
				spindash_flag = true;
				dash_timer = 2;
				ctrl = 0; // Skip the rest of the Normal Mode Routine
				scr_player_level_bound();
				scr_player_angle_pos();
			}
		}
	}
	else {
		anim_ID = anim_player.spindash;
		if !global.k_d_h {
			// Releasing spindash
			height = $E;
			width = 7;
			anim_ID = anim_player.roll;
			y += 5;
			status|=STA_SPIN;					// Set Rolling bit
			spindash_flag = false;
			xsp = 1;	// For camera lag's benefit
			gsp = anim_direction * (8 + (floor(dash_timer) / 2)) // this would be negative if the character were facing left, of course
			// Play Release sound
		}
		else {
			// Charging Spindash
			if (dash_timer > 0) {
				dash_timer -= (floor(dash_timer / 0.125)/256);
				if (dash_timer < 0)
				{
					dash_timer = 0;
					spindash_flag = false;
				}
			}
			if spindash_flag && global.k_abc_p {
				dash_timer += 2;
				if dash_timer > 8  dash_timer=8;
				// Revving sound
			}
		}
		ctrl = 0; // Skip the rest of the Normal Mode Routine
		scr_player_level_bound();
		scr_player_angle_pos();
	}
}