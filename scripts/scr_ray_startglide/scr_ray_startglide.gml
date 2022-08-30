// Taken from void Player_JumpAbility_Ray(void)
function scr_ray_startglide(){
		if double_jump_flag==0 && global.k_abc_p {
		status&=~STA_SPIN;			// No longer in a ball
		status&=~STA_ROLLJUMP;
		double_jump_flag = 1;
		double_jump_property = 0;
		scr_ray_airglide();
	}
}