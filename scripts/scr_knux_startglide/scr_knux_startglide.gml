function scr_knux_startglide(){
	if !double_jump_flag && global.k_abc_p {
		status&=~STA_SPIN;				// No longer in a ball
		status&=~STA_ROLLJUMP;
		height=HEIGHT_GLIDE;
		width=WIDTH_GLIDE;
		double_jump_flag=1;
		ysp+=2; if (ysp<0) ysp=0;
		gsp=4;
		glide_direction=anim_direction;					// Set initial direction of glide
		xsp=gsp*glide_direction;						// Set initial speed (not normally done here)
		double_jump_property=180*(not anim_direction);	// Set intial glide angle
		scr_player_jump_angle(angle);					// Reset Angle
		anim_ID=anim_player.glide;						// The original engine doesn't do this, but we are.
		glide_collision_prop=0;							// Reset Glide collision property
		glide_collision_prop|=STA_INAIR;				// Set in air
		knux_glide_set_anim_frame();					// Adjust anim frame based on movement
	}
}
function knux_glide_set_anim_frame(){
	// We need to change this to work with double jump property instead of xsp
	if (abs(xsp) >= 4)
        anim_framemod=0;
    if (abs(xsp) >= (4*0.32)) && (abs(xsp) < 4)
        anim_framemod=1;
    if (abs(xsp) < (4*0.32))
        anim_framemod=2;
}