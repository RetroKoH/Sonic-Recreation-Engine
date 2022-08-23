/// @description Bridge Routines
switch(routine)
{
	case 0:
	routine++;
	width=8*len;	// Actual collision width of bridge
	// Build Bridge (This won't be repeated)
	var l = len;
	var _x = x;
	var a;

	_x -= (l div 2)*$10;	// x_pos of left-most log

	repeat(len)
	{
		if _x != x	// if _x is not at the controller's position, create another log.
		{
			a = instance_create_layer(_x,y,"Instances",obj11_GHZBridge);
			a.routine=5;	// Empty routine (just display)
			a.len=0;		// Display logs don't have length
		}
		_x += $10;
	}
	break;
	case 1:
		var _h = floor(bbox_bottom-bbox_top) div 2;
		collide = scr_topsolid_obj(width, _h, _h, prev_x);
		// Add depression later.
	break;
}