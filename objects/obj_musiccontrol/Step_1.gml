/// @description Handle music

if bgm != -1
{
	if !audio_is_playing(bgm)
		playing = audio_play_sound(bgm,0,false);	// Play the zone's BGM if not already
	else
	{
		// if already playing, handle looping by resetting the position
		var _pos = audio_sound_get_track_position(playing);
		if (_pos > total_length)
			audio_sound_set_track_position(playing,_pos-loop_length);
		// There is a 3 second buffer for each BGM track to help ensure seamless looping
	}
}