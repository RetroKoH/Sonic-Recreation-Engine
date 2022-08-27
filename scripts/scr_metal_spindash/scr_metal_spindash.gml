function scr_metal_spindash(){
// Uses the Sonic CD Spindash
	if !spindash_flag {
		if anim_ID == anim_player.duck {
			if global.k_abc_p {
				// Initialize Spindash
				anim_ID = anim_player.spindash; // Just rolling, but will hover
				// Play CD spindash sound
				spindash_flag = true;
				dash_timer = 0;
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
			if (dash_timer >= 45)
			{
				height = $E;
				width = 7;
				anim_ID = anim_player.roll;
				y += 5;
				status|=STA_SPIN;			// Set Rolling bit
				spindash_flag = false;
				xsp = 1;	// For camera lag's benefit
				gsp = anim_direction * 12;	// this would be negative if the character were facing left, of course
				// Play Release sound
			}
			else
			{
				anim_ID = anim_player.idle;
				dash_flag = false;
			}
		}
		else {
			// Charging Spindash
			if (dash_timer < 45) dash_timer++;
		}
		ctrl = 0; // Skip the rest of the Normal Mode Routine
		scr_player_level_bound();
		scr_player_angle_pos();
	}
}