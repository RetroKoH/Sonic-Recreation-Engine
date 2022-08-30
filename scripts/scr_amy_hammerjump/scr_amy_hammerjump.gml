function scr_amy_hammerjump(){
	if !(double_jump_property){
		if (global.k_u_h) {
			if global.k_abc_p {
				ctrl = false;
				double_jump_property = 1;
				if (xsp == 0)
					anim_ID = anim_player.hammerjump_idle;
				else
					anim_ID = anim_player.hammerjump_run;
			}
		}
	}
	else { // if we are already performing the hammer jump, remove control and check the animation frame
		ctrl = false;								// Dont do anything during the animation
		if anim_spriteframe == 8 {					// At frame 8, we can begin entering the actual jump state
			status|=STA_INAIR;						// Set air state
			status&=~STA_PUSH;						// Clear push state
			ysp = !(status&STA_WATER) ? -8.5 : -7;	// Set speed accordingly.
			double_jump_property = 0;
		}
	}
}