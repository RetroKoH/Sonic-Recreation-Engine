/// @description Debug info
if (debug)
{
	if (bgm != -1)
	{
		var _pos = audio_sound_get_track_position(playing);
		draw_text(1082,12,"Music: "+string(bgm)+"\n"+
						 string(_pos)+" / "+string(total_length)+"\n"+
						 "Loop Start: "+string(intro_length)+"\n"+
						 "Paused: "+string(pause_timer));
	}
	else {
		draw_text(1082,12,"Music Not Loaded")
	}
}