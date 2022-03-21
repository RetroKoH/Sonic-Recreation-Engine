/// @description Spring Routines

if fading exit;

switch(routine)
{
	case 0:
		routine++;
	break;
	case 1:
		if instance_place(x,y-1,player)
		{
			routine++;
			anim_ID++;
			player.y += 8;
			player.ysp = -pow;
			player.status|=STA_INAIR;
			player.status^=STA_ONOBJ;
			//Animation
			player.routine=1;
		}
	break;
	case 2:
		// Simply animates. When animation ends, reset happens.
		if anim_finished
			routine++;
	break;
	case 3:
		anim_ID--;
		routine-=2;
	break;
}