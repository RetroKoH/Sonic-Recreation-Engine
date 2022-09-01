function scr_set_bgm(track){
	// Place title music in track listing and have a var for it to NOT loop
	scr_stop_bgm();
	with(global.core_music)
	{
		bgm				= global.BGM_list[track].ID;
		intro_length	= global.BGM_list[track].loop_start;
		var i			= max(intro_length,0);	// If -1, set to 0
		loop_length		= global.BGM_list[track].loop_end-i;
		total_length	= i+loop_length;
	}
}

function scr_stop_bgm(){
	with(global.core_music)
	{
		/*if audio_is_playing(bgm)
		{
			audio_stop_sound(bgm);
			bgm = -1;
		}*/
		show_debug_message("Stopping");
		if (bgm != -1)
		{
			if audio_is_playing(bgm) audio_stop_sound(bgm);
			bgm = -1;
			playing = -1;
			started = false;
			intro_length=0.000;	// length in ss.mmm of bgm intro
			loop_length=0.000;	// length in ss.mmm of loop intro
			total_length=0.000;	// intro + loop length
		} show_debug_message("BGM = "+string(bgm));
	}
}

function scr_play_1up(){
	with(global.core_music)
	{
		scr_pause_bgm();	// Pause BGM
		if audio_is_playing(bgm_1Up) audio_stop_sound(bgm_1Up);
		audio_play_sound(bgm_1Up,1,false);
		pause_timer = audio_sound_length(bgm_1Up)+.25;
	}
}

function scr_pause_bgm(){
	with(global.core_music)
	{
		if audio_is_playing(playing)
		{
			audio_pause_sound(playing);
		}
	}
}

function scr_unpause_bgm(){
	with(global.core_music)
	{
		if audio_is_paused(playing)
		{
			audio_resume_sound(playing);
		}
	}
}