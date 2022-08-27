function scr_mighty_startdive(){
	if !double_jump_flag && global.k_abc_p {
		double_jump_flag = true;
		xsp *= 0.5;		// xsp appears to be halved
		ysp = 12.5;		// Rebound force is 1.5625 (adjusted for angle)
		anim_ID = anim_player.drilldive;
	}
}