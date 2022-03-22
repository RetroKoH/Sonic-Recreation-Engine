function scr_ptfm_move(){
	switch(subtype){
		case 0: // Stationary
		break;
		case 1: // Horizontal (Right > Left)
			x = orig_x + (angle - $40);
			angle = osc_6a;
		break;
		case 5: // Horizontal (Left > Right)
			x = orig_x + (-angle + $40);
			angle = osc_6a;
		break;
		case 2: // Vertical (Down > Up)
			y_base = orig_y + (angle - $40);
			angle = osc_6a;
		break;
		case 6: // Vertical (Up > Down)
			y_base = orig_y + (-angle + $40);
			angle = osc_6a;
		break;
		case 3: // Set to fall if landed on
			if !delay{
				if y_sink==4 //if (status&STA_ONOBJ)
					delay=30;
			}
			else{
				delay--;
				if !delay{
					delay=32;
					subtype++; // Set to Subptye 4 (falling)
				}
			}
		break;
		case 4: // Falling after stood upon
		break
	}
}