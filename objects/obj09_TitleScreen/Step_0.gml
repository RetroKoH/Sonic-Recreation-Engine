/// @description Handle PSB Blinking

if fading exit;

if (PSB)
{
	PSB_timer--;
	if !PSB_timer
	{
		PSB_timer = 16;
		PSB_visible ^= true;
	}
}

if (global.k_st_p) && PSB
{
	scr_trigger_fade(GHZ);
}