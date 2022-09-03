/// @description Signpost Routines

if fading exit;

switch(routine)
{
	case 0: // Sign_Touch
	{
	    var d0; d0=player.x-x;
	    // If main player is within 20 pixels of the signpost to the left, enter this code
	    if !(d0<0 || d0>=20)
	    {
	        audio_play_sound(sfx_Signpost,1,false);
	        f_timecount = false; // Clear Time Count flag
			v_limitleft2 = v_limitright2-424;
	        routine++;
			anim_ID++;    // Start the first animation.
	    }
	} break;

	case 1: // Sign_Spin
	{
	    //if anim_ID == 0 anim_ID = 1;    // Start the first animation.
	    spintime--;               // Subtract 1 from the amount of time needed to spin.
	    if !spintime              // If time doesn't remain in the spin timer,
	    {
	        anim_ID++;                // Go to the next animation.
	        if anim_ID==3 routine++;  // If we reached 3, move to the next routine.
	        else spintime=60;      // Set the next spintime for 1 second.
	    }
	    else if (spintime || anim_ID<3) // Otherwise, check both spin count and timer, and if they are not done, branch to the sparkles code.
	    {
	        var spark; // Temporary variable for sparkle object.
	        //@chksparkle
	        sparkletime-=1;		// Subtract 1 from the amount of time to sparkle
	        if !sparkletime		// If time doesn't remain in the sparkle timer,
	        {
	            sparkletime=$B;						// Set the next sparkle time for 11 frames.
	            spark=instance_create_layer(x+sparkpos[sparkleid,0],y+sparkpos[sparkleid,1],"Instances",obj25_Ring); // Create sparkle
	            spark.routine=4;					// Set to ring sparkle routine
				with(spark) scr_obj_priority(2);	// Set priority
	            if sparkleid<7 sparkleid+=1; else sparkleid=0; // increment sparkle counter
	        }
	    }
	} break;

	case 2: // Sign_SonicRun
	{
		routine++;
		scr_got_through_act();
	} break;
}