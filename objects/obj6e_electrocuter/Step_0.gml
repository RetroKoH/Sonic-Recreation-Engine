/// @description Electrocuter Routines
if fading exit;
switch(routine)
{
	case 0:
		routine++;
		frequency=(subtype*$10)-1; // Shock Frequency. For example, subtype 8: 8 -> $80 (128) -1= 127 steps.
	break;
	case 1:
	if (framecount&frequency)==frequency
	{
	    anim_ID=1;					// Zapping occurs on a timer
		can_harm=true;
	    sound_play(sfx_SBZZap);	// Zapping sound
	}
	if can_harm && anim_ID==0 can_harm=false;
	break;
}