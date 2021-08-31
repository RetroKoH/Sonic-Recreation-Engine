function scr_sonic_death(){
	f_timecount = false;
	invinc_timer = 0;
	super_flag = false;
	routine = 3;
	status	|=	STA_INAIR;	// Set Air status bit
	ysp=-7;
	xsp=0;
	gsp=0;
	anim_ID = anim_player.death;
	// Play death sound
}