/// @description Bridge Routines
switch(routine)
{
	case 0:
	routine++;
	width=8*len;	// Actual collision width of bridge
	// Build Bridge (This won't be repeated)
	var l = len;
	var _x = x;

	_x -= (l div 2)*$10;	// x_pos of left-most log

	repeat(len)
	{
		if _x != x	// if _x is not at the controller's position, create another log.
		{
			var a = instance_create_layer(_x,y,"Instances",obj11_GHZBridge);
			a.routine=5;	// Empty routine (just display)
			a.len=0;		// Display logs don't have length
		}
		_x += $10;
	}
	break;
	case 1:
		collide = scr_topsolid_obj(width, 8);
		// Add depression later.
	break;
}