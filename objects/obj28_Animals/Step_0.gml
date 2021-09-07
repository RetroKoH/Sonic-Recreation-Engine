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
		var dist = scr_get_floor_dist(0, height, 0)
		if dist <= 0
		{
			y += dist;
			xsp = mov_xsp;
			ysp = mov_ysp;
			image_index = 1;
			image_xscale = -1; // Enemy animals always face left
			routine += subtype+1;
		}
	break;
	case 2: // Flicky (Subtype 0; Sub #5 in Sonic 1 engine)
	case 7: // Clucky (Subtype 5; Sub #1 in Sonic 1 engine)
		x+=xsp; y+=ysp; // SpeedToPos
		ysp += .09375;
		var dist = scr_get_floor_dist(0, height, 0)
		if dist <= 0
		{
			y += dist;
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
	case 3: // Ricky (Subtype 1; Sub #6 in Sonic 1 engine)
	case 4: // Pocky (Subtype 2; Sub #0 in Sonic 1 engine)
	case 5: // Pecky (Subtype 3; Sub #2 in Sonic 1 engine)
	case 6: // Picky (Subtype 4; Sub #4 in Sonic 1 engine)
	case 8: // Rocky (Subtype 6; Sub #3 in Sonic 1 engine)
		x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
		if ysp > 0		image_index = 2;
		var dist = scr_get_floor_dist(0, height, 0)
		if dist <= 0
		{
			y += dist;
			ysp = mov_ysp;
			image_index = 1;
		}
	break;
}

/*else
{

}*/