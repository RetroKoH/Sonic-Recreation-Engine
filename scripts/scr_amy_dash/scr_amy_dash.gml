function scr_amy_dash(){
	if !dash_flag {
		if anim_ID == anim_player.duck {
			if global.k_abc_p {
				// Initialize dash
				anim_ID = anim_player.peelout;
				// Play CD spindash sound
				dash_flag = true;
				dash_timer = 0;
				ctrl = false; // Skip the rest of the Normal Mode Routine
				scr_player_level_bound();
				scr_player_angle_pos();
			}
		}
	}
	else {
		anim_ID = anim_player.peelout;
		if !global.k_d_h {
			// Releasing dash
			if (dash_timer >= 30)
			{
				anim_ID = anim_player.walk;
				dash_flag = false;
				xsp = 1;	// For camera lag's benefit
				gsp = anim_direction * 10;	// this would be negative if the character were facing left, of course
				// Play Release sound
			}
			else
			{
				anim_ID = anim_player.idle;
				dash_flag = false;
			}
		}
		else {
			// Charging dash
			if (dash_timer < 30) dash_timer++;
		}
		ctrl = 0; // Skip the rest of the Normal Mode Routine
		scr_player_level_bound();
		scr_player_angle_pos();
	}
}