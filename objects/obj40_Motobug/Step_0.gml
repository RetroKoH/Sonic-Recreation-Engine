/// @description Motobug Routines

switch(routine)
{
	// Routine 0 - Waiting, and getting ready to move the motobug when ready. (Secondary routine 0 in the ASM)
	case 0:
	{
	    if (time) time-=1;                                // Count down wait timer.
	    else                                            // If timer is already 0...
	    {
	        routine++;                                  // We will run the second routine afterwards.
	        AnimationDirection*=-1;                     // Reverse the direction.
	        xsp=-1*AnimationDirection;                  // Set horizontal speed 1 pixel/step.
	        turntime=180;
	    }
	}

	// Routine 1 - Moving the motobug, creating smoke, and checking for when it needs to stop.
	case 1:
	{
	    x+=xsp;                                         // Move the motobug.
	    y+=ysp;
	    turntime-=1;
    
	    // Check for floor. If it doesn't exist, stop and wait, then turn around. For now, set to a timer.
	    if !turntime //if !instance_place()
	    {
	        routine--;
	        time=59;
	        xsp=0;
	    }

	    // Smoke puff routine. Only occurs when the badnik is moving.
	    if !smokedelay && turntime
	    {
	        //instance_create_layer(x,y,obj40Sub_MotobugSmoke); // Create smoke puff
	        smokedelay=$F;                              // Reset timer
	    }
	    else smokedelay-=1;                             // Reduce timer
	}
}
