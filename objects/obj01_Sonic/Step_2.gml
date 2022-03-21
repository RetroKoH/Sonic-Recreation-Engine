/// @description Animation Handling

if fading exit;

//==== Manage Direction ====
if (status&1) anim_direction=-1; else anim_direction=1;
if (status&$20) anim_ID=anim_player.push;

// ==== Manage Animation Speed, and switch running animations ====
switch(anim_ID)
{
    case anim_player.walk:
	case anim_player.jog:
    case anim_player.run:
    case anim_player.dash:
        {
            if abs(gsp)>=10 anim_ID=anim_player.dash;
            else if abs(gsp)>=6 anim_ID=anim_player.run;
			else if abs(gsp)>=4 anim_ID=anim_player.jog;
            else anim_ID=anim_player.walk;
        }
        anim_speedmod=2/max(8-abs(gsp),1);
        break;
    case anim_player.roll:
        anim_speedmod=2/max(5-abs(gsp),1);
        break;
    default:
        anim_speedmod=1;
}

// ==== Manage Animation Angle ====
switch(anim_ID)
{
    case anim_player.roll:
    //case anim_player.spindash:
        anim_angle = 0;
        break;
    default:
		anim_angle = angle;
        /*if !(status&STA_INAIR) // if not in air
        {
			//if (angle>180) anim_angle = 360-angle;
			//else anim_angle = angle;
			anim_angle = angle;
            //if (abs(angle-anim_angle)<45)   AnimationAngle=scrRotateTowardsAngle(AnimationAngle,angle,max(1,abs(xsp)));
            //else                                AnimationAngle=angle;
        }*/
        //else anim_angle = 0; //anim_angle=scrRotateTowardsAngle(AnimationAngle,global.gravity_angle,4);
} anim_angle = (anim_angle div 15)*15;

// Animation Handling
scr_handle_anim();