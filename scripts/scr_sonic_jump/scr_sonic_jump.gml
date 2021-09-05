function scr_sonic_jump(){
	// Subroutine enabling Sonic to jump.

	var jump_flag; jump_flag=0;//collision_line(x-width,y-25,x+width,y-25,obj00_Solid,1,0);
	if global.k_abc_p
	{
	    if (status&STA_WATER) jmp=3.5; else jmp=6.5;	// Alter gravity depending on underwater status bit 
	    if !jump_flag									// Check ceiling collision with a line.
	    {
	        xsp-=jmp*sin(degtorad(angle));
	        ysp-=jmp*cos(degtorad(angle));
	        status|=STA_INAIR;						// Set Air status bit
	        if (status&STA_PUSH) status^=STA_PUSH;	// Clear Pushing status bit
			if (status&STA_ONOBJ)					// Clear On Obj status bit
			{
				status^=STA_ONOBJ;
				// This should be handled in the platform object itself.
				if platform_ID.object_index == obj18_Platform
					platform_ID.routine--;
				platform_ID = -1;
			}
	        jump=true;
	        convex=false;
	        move_lock=false;
	        //sound_play(sndA0_Jump);
	        if (status&STA_SPIN) status|=STA_ROLLJUMP; // Set Rolling Jump bit if necessary.
	        else
	        {
	            height=$E;
	            width=7;
	            anim_ID=anim_player.roll;
	            status|=STA_SPIN;				// Set Rolling bit
	            y+=defaultHeight-height;		// Reposition according to height change
	        }
	    }
	}
}