function scr_set_bgm(track){
	with(global.core_music)
	{
		bgm				= global.BGM_list[track].ID;
		intro_length	= global.BGM_list[track].loop_start;
		loop_length		= global.BGM_list[track].loop_end-intro_length;
		total_length	= intro_length+loop_length;
	}
}