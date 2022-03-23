/// @description Bridge Routine
switch(routine)
{
	case 0:
	routine++;
	// Build Bridge (This won't be repeated)
	var l = len;
	var _x = x;

	_x -= (l div 2)*$10;	// x_pos of left-most log

	repeat(len)
	{
		if _x != x
		{
			var a = instance_create_layer(_x,y,"Instances",obj11_GHZBridge);
			a.routine=1;
			a.len=0;
		}
		_x += $10;
	}
	break;
}