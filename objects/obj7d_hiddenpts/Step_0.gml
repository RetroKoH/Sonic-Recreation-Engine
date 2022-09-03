/// @description Insert description here

switch(routine){
	case 0: // Init
		routine++;
		subtype=image_index;			// Try something new for subtype setting
		points=100*power(10,subtype);	// Set points to 100, 1000, or 10000
		timer=119;						// Bonus will appear for about 2 seconds when revealed.
	break;
	case 1: // Invisible, waiting to be hit
	break;
	case 2: // After being hit
		routine++
		visible=true;
		audio_play_sound(sfx_BonusHiddenPts,1,false);
		scr_add_points(points);
	break;
	case 3: // Countdown to destruction
	    timer--; if !(timer) instance_destroy();
	break;
}
