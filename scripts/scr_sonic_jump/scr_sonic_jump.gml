function scr_sonic_jump(){
	// Subroutine enabling Sonic to jump.

	var jump_flag; jump_flag=0;//collision_line(x-width,y-25,x+width,y-25,obj00_Solid,1,0);
	if global.k_abc_p
	{
	    if (status&$40) jmp=3.5; else jmp=6.5;	// Alter gravity depending on underwater status bit 
	    if !jump_flag							// Check ceiling collision with a line.
	    {
	        xsp-=jmp*sin(degtorad(angle));
	        ysp-=jmp*cos(degtorad(angle));
	        status|=2;                            // Set Air status bit
	        if (status&$20) status^=$20;  // Clear Pushing status bit
	        jump=true;
	        convex=false;
	        move_lock=false;
	        //sound_play(sndA0_Jump);
	        height=$13;
	        width=9;
	        if (status&4) status|=$10; // Set Rolling Jump bit if necessary.
	        else
	        {
	            height=$E;
	            width=7;
	            anim_ID=anim_player.roll;
	            status|=4;		// Set Rolling bit
	            y+=5;			// Pop Sonic's center 5 pixels down to accomodate for the size change.
	        }
	    }
	}
}