/// @description Spring Routines

if fading exit;

switch(routine)
{
	case 0:
		routine++;
	break;
	case 1:
		event_inherited(); // Get solid collision
		if collide == 1 // If top collision
		{
			routine++;
			anim_ID++;
			player.y += 8;
			player.ysp = -pow;
			player.status|=STA_INAIR;
			player.status^=STA_ONOBJ;
			player.anim_ID=anim_player.idle;
			audio_play_sound(sfx2C_Spring,1,false);
			player.anim_ID = anim_player.spring;
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