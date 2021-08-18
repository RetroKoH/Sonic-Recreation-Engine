function scr_sonic_roll_speed(){
	// Subroutine to change Sonic's speed while he is rolling.
	var rf; rf=(accel_run/2); //.0234375

	if !move_lock
	{
	    if global.k_l_h // is left being pressed?
	    {
	        if gsp==0 {status|=1; anim_ID=anim_player.roll;}
	        else if gsp>0 {if gsp>=0.125 gsp-=0.125; else gsp=0;}
	    }
	    else if global.k_r_h // is right being pressed?
	    {
	        if gsp==0 {if (status&1) status^=1; anim_ID=anim_player.roll;}
	        if gsp<0 {if gsp<=-0.125 gsp+=0.125; else gsp=0;}
	    }
	    // The following is applied constantly throughout rolling.
	    {
	        if gsp<0 {if gsp<=-rf gsp+=rf; else gsp=0;}     // Friction when rolling left
	        else if gsp>0 {if gsp>=rf gsp-=rf; else gsp=0;} // Friction when rolling right
	        if gsp==0
			{
				if (status&4) status^=4;
				height=$13; width=9;
				anim_ID=anim_player.idle;
				y-=5;
			}
	    }
	}

	// Apply to x and y speeds using the acquired gsp. Rolling has a speed cap of 16 pixels/step.
	ysp=gsp*-sin(degtorad(angle));
	var xv; xv=gsp*cos(degtorad(angle));
	if xv>16 xsp=16; else if xv<-16 xsp=-16;
	else xsp=xv;
	
	scr_check_walls_on_ground();
}