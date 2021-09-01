function scr_ptfm_move(){
	switch(subtype){
		case 0: // Stationary
		break;
		case 1: // Horizontal (Right > Left)
			x = orig_x + (angle - $40);
			angle = osc_6a;
		break;
		case 2: // Vertical (Down > Up)
			y_base = orig_y + (angle - $40);
			angle = osc_6a;
		break;
		case 6:
			y_base = orig_y + (-angle + $40);
			angle = osc_6a;
		break;
	}
}