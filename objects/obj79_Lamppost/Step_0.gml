/// @description Lamppost Routines

if fading exit;

switch(routine)
{
	case 0:
		routine++;					// Go to Blue lamppost routine
		scr_obj_priority(5);
		if (lamp_last >= subtype) {
			routine++;				// Skip to Red lamppost routine
			anim_ID=routine;
	}
	break;
	case 1:
		if (lamp_last >= subtype) {
			routine++;				// Skip to Red lamppost routine
			anim_ID=routine;
		}
		else {
			// Chkhit
			if (abs(player.x-x+8) <= $10) && (abs(player.y-y+$40) <= $68){
				audio_play_sound(sfx_Lamppost,1,false);
				routine++;	// Go to twirling lamppost routine
				anim_ID++;	// Twirling animation
				
				// Set lamp info
				global.lamp_last = subtype;				// Set the last lamppost
				global.lamp_xpos = x;
				global.lamp_ypos = y;
				global.lamp_rings = global.p_rings;		// Store ring count
				global.lamp_time = global.p_time;		// Store current time
			}
		}
	break;
	case 2:
		// Display
	break;
}