function scr_amy_starthmrhover(){
	if (anim_ID == anim_player.hammerjump_idle || anim_ID == anim_player.hammerjump_run)
		exit;
	else {
		if !(double_jump_flag) && (global.k_abc_p) {
			double_jump_flag = 1;
			height = HEIGHT_ROLL;
			width = WIDTH_ROLL;
			xsp = 5.5*anim_direction;
			gsp = xsp;
			ysp = 0;
			anim_ID=anim_player.hammerhover;
		}
	}
}