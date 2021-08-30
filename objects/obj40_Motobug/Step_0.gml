/// @description Motobug Routines

if fading exit;

// Routine 0 - Set position on the ground
if routine == 0
{
	x+=xsp; ysp+=.21875; y+=ysp;	// ObjectFall
	if scr_obj_check_floor()
	{
		routine++;
		ysp = 0;
	}
}
	
else switch(routine_2nd)
{
	// Secondary Routine 0 - Waiting, and getting ready to move the motobug when ready
	case 0:
	{
		if (time) time--;			// Count down wait timer.
		else						// If timer is already 0...
		{
		    routine_2nd++;			// We will run the second routine afterwards.
		    anim_direction*=-1;		// Reverse the direction.
		    xsp=-1*anim_direction;	// Set horizontal speed 1 pixel/step.
			anim_ID=1;
		}
	} break;

	// Secondary Routine 1 - Moving the motobug, creating smoke, and checking for when it needs to stop.
	case 1:
	{
		x+=xsp; y+=ysp; // SpeedToPos

		// Check for floor. If it doesn't exist, stop and wait, then turn around. For now, set to a timer.
		if scr_obj_floor_pos(sign(xsp))==false
		{
		    routine_2nd--;
		    time=59;
		    xsp=0;
			anim_ID=0;
		}

		// Smoke puff routine. Only occurs when the badnik is moving.
		if !smokedelay
		{
		    instance_create_layer(x+(15*anim_direction),y-1,"Instances",obj40Sub_MotobugSmoke); // Create smoke puff
		    smokedelay=$F;                              // Reset timer
		}
		else smokedelay-=1;                             // Reduce timer
	} break;
}