/// @description Crabmeat Routines

if fading exit;

// Routine 0 - Set position on the ground
if routine == 0
{
	x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
	var dist = scr_get_floor_dist(0, height, 0)
	if dist <= 0
	{
		y+=dist;
		routine++;
		ysp = 0;
	}
}

else switch(routine_2nd)
{
    case 0: // Wait to fire
    {
        timedelay-=1;
        if !(timedelay)
        {
            crabmode^=2;
            if (crabmode&2)
            {
                // Fire
                timedelay=59;
                // Set firing animation
				anim_ID = 2;
                var left,right;
                left=instance_create_layer(x-10,y,"Instances",obj23_Missile);
                left.xsp=-1;
				left.ysp=-4;
				left.subtype = 1;
                right=instance_create_layer(x+10,y,"Instances",obj23_Missile);
                right.xsp=1;
				right.ysp=-4;
				right.subtype = 1;
            }
            else
            {
                // Move crabmeat
                routine_2nd++;
                timedelay=127;
                status^=1;
                if (status) xsp=-.5; else xsp=.5;
                // Set animation.
				anim_ID = 1;
            }
        }
    } break;
    case 1: // Walk on floor
    {
        timedelay-=1;
        if (timedelay)
        {
            x+=xsp; y+=ysp;  // SpeedToPos
            crabmode^=1;
            if !(crabmode&1)
                if scr_obj_floor_pos(sign(xsp))==false
                {
                    routine_2nd--;
                    timedelay=59;
                    xsp=0;
                    // Set animation
					anim_ID = 0;
                }
        }
        else
        {
            routine_2nd--;
            timedelay=59;
            xsp=0;
            // Set animation
			anim_ID = 0;
        }
    } break;
}