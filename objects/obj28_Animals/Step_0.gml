/// @description Insert description here
var pts, s = subtype;

switch(routine)
{
	case 0:
		// For now, assume this animal is from a badnik
		routine++;
		sprite_index = ani_sprite[s];
		mov_xsp = ani_xsp[s];
		mov_ysp = ani_ysp[s];
		ysp = -4;
		pts=instance_create_layer(x,y,"Instances",obj29_Points); // Create the points object.
		pts.image_index=pti+1;                 // Set the image index of the points accordingly.
	break;
	case 1:
		x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
		if scr_obj_check_floor()
		{
			xsp = mov_xsp;
			ysp = mov_ysp;
			image_index = 1;
			image_xscale = -1; // Enemy animals always face left
			routine += subtype+1;
		}
	break;
	case 2: // Flicky (Subtype 0; Sub #5 in Sonic 1 engine)
		x+=xsp; y+=ysp; // SpeedToPos
		ysp += .09375;
		if scr_obj_check_floor()
		{
			ysp = mov_ysp;
		}
		frame_time -= 1;
		if frame_time < 0
		{
			frame_time = 1;
			if image_index == 1 image_index++;
			else image_index--;
		}
	break;
}

/*else
{
	x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
	if ysp > 0		image_index = 2;
	if scr_obj_check_floor()
	{
		ysp = mov_ysp;
		image_index = 1;
	}
}*/