function scr_metal_dash(){
	if !double_jump_flag && global.k_abc_p {
		status&=~STA_ROLLJUMP;
		double_jump_flag = true;
		var vert = (global.k_d_h)-(global.k_u_h);
		var horz = (global.k_r_h)-(global.k_l_h);
		
		if (vert == 0) && (horz == 0) {
			xsp = 8*anim_direction;
			gsp = xsp;
			ysp = 0;
		}
		else
		{
			xsp = 8*horz;
			gsp = xsp;
			ysp = 8*vert;
		}
	}
}