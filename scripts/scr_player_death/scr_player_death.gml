function scr_player_death(){
	f_timecount = false;
	invinc_timer = 0;
	super_flag = false;
	routine = 3;
	status |= STA_INAIR;	// Set Air status bit
	ysp=-7;
	xsp=0;
	gsp=0;
	anim_ID = anim_player.death;
	audio_play_sound(S2_23_Hurt,1,false);
}