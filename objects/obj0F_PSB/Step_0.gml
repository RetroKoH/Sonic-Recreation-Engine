/// @description Handle PSB Blinking
if global.fading exit;

timer--;
if !timer
{
	timer = 16;			// Reset timer
	visible ^= true;	// Toggle true/false
}

if (global.k_st_p)
	scr_trigger_fade(GHZ);