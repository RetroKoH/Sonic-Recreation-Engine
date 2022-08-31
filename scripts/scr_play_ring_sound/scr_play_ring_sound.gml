function scr_play_ring_sound(){
	if (global.ring_pan==1) // Right
		audio_play_sound(sfx_Ring_A,1,false);
	else // Left
		audio_play_sound(sfx_Ring_B,1,false);
	global.ring_pan^=1;
}