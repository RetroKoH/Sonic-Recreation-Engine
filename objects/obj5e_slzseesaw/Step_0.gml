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
		event_inherited();
		if collide routine++;
		if y_sink > 0
			y_sink -= .25;
		scr_ptfm_move(); // Move
		y = y_base + y_sink; // Nudge
	break;
	case 2:
		event_inherited();
		if !collide routine--;
		if y_sink < 4
			y_sink += .25;
		scr_ptfm_move(); // Move
		y = y_base + y_sink; // Nudge
	break;
}