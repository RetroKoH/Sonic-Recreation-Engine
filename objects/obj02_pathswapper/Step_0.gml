/// @description Path Swapper routines

switch(routine)
{
	case 0:
		routine++;
		radius = $20 << (subtype&3) // collision radius of the object

		// Orientation
		orientation = sign(subtype&4);
		
		flag_rightdown	= sign(subtype&8);		// operation when the player crosses from left to right or up to down - 0 means move to low plane, 1 means move to high plane
		flag_leftup		= sign(subtype&$10);	// operation when the player crosses from right to left or down to up - 0 means move to low plane, 1 means move to high plane
		flag_ground		= sign(subtype&$80);	// A flag which if set indicates that the swapper should only change the collision plane when the player is on the ground
		image_index		= flag_rightdown + (flag_leftup*2);
	break;
	
	case 1: // Check Sonic's position
		if orientation == 0
		{
			if player.x > x swap_flag = true; // For vertical swappers (if Sonic is to the right)
			routine = 2;
		}
		else
		{
			if player.y > y swap_flag = true; // For horizontal swappers (If Sonic is under)
			routine = 2;
		}
	break;
	
	case 2: // Vertical (PSwapper_MainX)
	if (x-8 < player.x && player.x < x+8)
		if !swap_flag {
			// If Sonic.x was less than or equal to swapper.x (to the left), check if now to the right
			if (player.x > x) //&& (flag_ground && !player.status&STA_INAIR)
				if (flag_ground && !(player.status&STA_INAIR)) || (!flag_ground)
					if (y-radius < player.y && player.y < y+radius)
					{
						player.col_path = flag_rightdown;
						swap_flag = true;
					}
		}
		else {
			if (player.x < x) //&& (flag_ground && !player.status&STA_INAIR)
				if (flag_ground && !(player.status&STA_INAIR)) || (!flag_ground)
					if (y-radius < player.y && player.y < y+radius)
					{
						player.col_path = flag_leftup;
						swap_flag = false;
					}
		}
	break;
	
	case 3:  // Horizontal (PSwapper_MainY)
	
	break;
}