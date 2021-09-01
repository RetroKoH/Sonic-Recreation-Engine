/// @description Buzz Bomber Routines

switch(routine)
{
	case 0: //move
		timedelay--; if !timedelay {
			if buzz_status == 2 {
				var shot = instance_create_layer(x+($14*-anim_direction),y+$1C,"Instances",obj23_Missile);
				shot.xsp = 2*-anim_direction;
				shot.ysp = 2;
				//timedelay = $E; // Apply time delay to the missile
				buzz_status = 1;
				timedelay = 59;
				anim_ID = 2;
			}
			else {
				routine++;
				timedelay = 127;
				xsp = 4 * -anim_direction;
				anim_ID = 1;
			}
		}
	break;
	case 1: //chknearsonic
		timedelay--; if !timedelay {
			buzz_status = 0;
			anim_direction *= -1;
			timedelay = 59;
			routine--;
			xsp = 0;
			anim_ID = 0;
		}
		else {
			x+=xsp; y+=ysp; // SpeedToPos
			if !buzz_status {
				if abs(x-player.x) <= $60 {
					buzz_status = 2;
					timedelay = 29;
					routine--;
					xsp = 0;
					anim_ID = 0;
				}
			}
		}
	break;
}
