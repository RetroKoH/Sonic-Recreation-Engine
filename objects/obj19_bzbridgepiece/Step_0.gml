/// @description Platform Routines

switch(routine)
{
	case 0:
		y_base = y;
		orig_x = x;
		orig_y = y;
		angle = $80;
		routine++;
	break;
	case 1:
		if y_sink > 0
			y_sink -= .25;
		scr_ptfm_move(); // Move
		y = y_base + y_sink; // Nudge
	break;
	case 2:
		if y_sink < 4
			y_sink += .25;
		var temp_x = x;
		scr_ptfm_move(); // Move
		y = y_base + y_sink; // Nudge
		// Move Sonic
		player.y = bbox_top-player.height;
		player.x -= (temp_x - x)
	break;
}