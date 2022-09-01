/// @description Init music handler
bgm = -1;			// No track
playing = -1;		// Instance of track being played
started = false;	// Has the track started?
//paused = false;		// Has the track been paused?
pause_timer = -1;	// If so, are we counting down to an unpause?
// If this is -1, pause is indefinite.

intro_length=0.000;	// length in ss.mmm of bgm intro
loop_length=0.000;	// length in ss.mmm of loop intro
total_length=0.000;	// intro + loop length