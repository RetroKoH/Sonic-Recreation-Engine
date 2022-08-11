/// @description Handle PSB and Menu
if global.fading exit;

// PRESS START BUTTON
if !menu
{
	timer--;
	if !timer
	{
		timer = 16;			// Reset timer
		visible ^= true;	// Toggle true/false
	}

	if (global.k_st_p)
	{
		menu=true;
		timer=16;
		visible=true;
	}
}

// Menu
else
{
	if (global.k_u_p || global.k_d_p)
	{
		option ^= 1;	// This is fine for only two options
		audio_play_sound(S2_4D_SwitchBeep,1,false);
	}
	if (global.k_st_p)
	{
		if option==0	scr_trigger_fade(rm_GHZ1);
		else			scr_trigger_fade(rm_option);
		if audio_is_playing(S1_12_Title)
			audio_stop_sound(S1_12_Title);
	}
}