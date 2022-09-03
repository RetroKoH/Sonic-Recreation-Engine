function scr_player_death(spiked=false){
	invinc_timer = 0;		// Clear Invinc status and remove stars
	super = false;
	routine = 3;
	status |= STA_INAIR;	// Set Air status bit
	ysp=-7;
	xsp=0;
	gsp=0;
	anim_ID = anim_player.death;
	coolbonus = 0;
	if (spiked) audio_play_sound(sfx_HitSpike,1,false);
	else audio_play_sound(sfx_Hurt,1,false);
}