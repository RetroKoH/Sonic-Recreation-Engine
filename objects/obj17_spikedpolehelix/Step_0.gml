/// @description Spiked Log Routines
switch(routine)
{
	case 0:
	routine++;
	width=8*len;	// Actual collision width of Spiked Log
	// Build Log Helix (This won't be repeated)
	var l = len;
	var _x = x;
	var a;

	_x -= (l div 2)*$10;	// x_pos of left-most spiked log
	var fr = 0;				// Frame for piece
	
	repeat(len)
	{
		if _x != x	// if _x is not at the controller's position, create another log.
		{
			a = instance_create_layer(_x,y,"Instances",obj17_SpikedPoleHelix);
			a.routine=1;		// Empty routine (just display)
			a.len=0;			// Display logs don't have length
			a.helix_frame=fr;	// Set helix frame for the child object
			fr++;
			fr&=7;
		}
		else
		{
			helix_frame=fr;
			fr++;
			fr&=7;
		}
		_x += $10;
	}
	break;
	case 1:
		can_harm = false;
		image_index = (sync0_frame + helix_frame)&7;
		if !(image_index) can_harm = true;
	break;
}