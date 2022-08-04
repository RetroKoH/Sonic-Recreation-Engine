function scr_set_bgm(track){
	// Place title music in track listing and have a var for it to NOT loop
	
	
	scr_stop_bgm();
	with(global.core_music)
	{
		bgm				= global.BGM_list[track].ID;
		intro_length	= global.BGM_list[track].loop_start;
		loop_length		= global.BGM_list[track].loop_end-intro_length;
		total_length	= intro_length+loop_length;
	}
}

function scr_stop_bgm(){
	with(global.core_music)
	{
		if audio_is_playing(bgm)
		{
			audio_stop_sound(bgm);
			bgm = -1;
		}
	}
}
