/// @description Chain Routines
switch(routine)
{
	case 0:
		routine=1;	// Unlike Sonic 1, we start with the anchor first. This piece controls movement.
		var len = (subtype&$F);
		var _y = y;
		var a;
	
		repeat(len){
			_y += $10;
			a = instance_create_layer(x,_y,"Instances",obj15_SwingChain);
			a.routine=2;			// Empty routine (just display)
			a.depth=4;
			a.image_index=1;
			a.dist=_y-orig_y;
			array_push(pieces,a);	// Store chain links
		}
		if (subtype&$10)
			a = instance_create_layer(x,_y+8,"Instances",obj15_SwingBall);
		else
			a = instance_create_layer(x,_y+8,"Instances",obj15_SwingPlatform_A);
		a.dist=_y-orig_y+8;
		array_push(pieces,a);	// Store main object at the end
	break;
	
	// Move
	case 1:
		var p;
		// Change to have each piece move itself?
		for (var i=0; i<=subtype&$F; i++)
		{
			var ang = osc_6a;
			p = pieces[i];
			p.y = orig_y + (p.dist*cos(degtorad(ang)));
			p.x = orig_x + (p.dist*sin(degtorad(ang)));
		}
	break;
	
	// Display (Anchor)
	default:
	break;
}