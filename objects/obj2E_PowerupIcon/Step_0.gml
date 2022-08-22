/// @description Present Icon
// This tells the object to move upwards with ysp. While it is moving upwards, ysp decreases.
// If the object is NOT moving, it fades out and deletes itself.

switch(routine)
{
	case 0:
		if ysp<0 // If the object is moving,
		{
		    y+=ysp;     // Move the object upwards with ysp.
		    ysp+=.09375; // Reduce the speed by $0018/256.
		}
		else scr_give_powerup(image_index-3); // "Sprite" is a subsprite of the monitor sprite.
	break;
	case 1:
		timedelay--;
		if !timedelay routine++;
	break;
	case 2:
	    if image_alpha>0 image_alpha-=.1;
		else instance_destroy();
	break;
}