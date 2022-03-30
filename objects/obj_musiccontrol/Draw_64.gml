/// @description Debug info

if debug && bgm != -1
{
	var _pos = audio_sound_get_track_position(playing);
	draw_text(980,12,"Music: "+string(bgm)+"\n"+
					 string(_pos)+" / "+string(total_length)+"\n"+
					 "Loop Start: "+string(intro_length));
}
