/// @description Handle music
if bgm != -1
{
	if (audio_is_playing(bgm))
	{
		if audio_is_paused(bgm)
		{
			if (pause_timer != -1) {
				pause_timer-=1/60;
				if (pause_timer<=0){
					scr_unpause_bgm();
					pause_timer=-1;
				}
			}
		}
		else {
			// if already playing, handle looping by resetting the position
			var _pos = audio_sound_get_track_position(playing);
			if (_pos >= total_length){
				if (intro_length==-1)
					scr_stop_bgm();	// Stop music (This one doesn't seem to get reached at any point)
				else
					audio_sound_set_track_position(playing,_pos-loop_length);
			// There is a 3 second buffer for each BGM track to help ensure seamless looping
			}
		}
	}
	else if !(started)
	{
		playing = audio_play_sound(bgm,0,false);	// Play the assigned BGM if not already
		started = true;
	}
	else scr_stop_bgm();	// Stops non-looping music
}