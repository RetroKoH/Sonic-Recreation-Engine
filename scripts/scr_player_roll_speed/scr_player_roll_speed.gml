function scr_player_roll_speed(){
	// Subroutine to change Sonic's speed while he is rolling.
	var rf; rf=(accel_run/2); //.0234375

	if !move_lock
	{
		var move=(global.k_r_h - global.k_l_h);	// Movement based on key control.
	    if move == -1 // is left being pressed?
	    {
	        if gsp==0		{status|=STA_FACING; anim_ID=anim_player.roll;}
	        else if gsp>0	gsp = (gsp>=0.125) ? gsp-0.125 : 0;
	    }
	    else if move == 1 // is right being pressed?
	    {
	        if gsp==0		{status&=~STA_FACING; anim_ID=anim_player.roll;}
	        else if gsp<0	gsp = (gsp<=-0.125) ? gsp+0.125 : 0;
	    }
	    // The following is applied constantly throughout rolling.
	    {
	        if gsp<0		gsp = (gsp<=-rf) ? gsp+rf : 0;	// Friction when rolling left
	        else if gsp>0	gsp = (gsp>=rf) ? gsp-rf : 0;	// Friction when rolling right
	        if gsp==0
			{
				status&=~STA_SPIN;
				y-=defaultHeight-height;
				height=defaultHeight;
				width=9;
				anim_ID=anim_player.idle;
			}
	    }
	}

	// Apply to x and y speeds using the acquired gsp. Rolling has a speed cap of 16 pixels/step.
	ysp=gsp*-sin(degtorad(angle));
	var xv; xv=gsp*cos(degtorad(angle));
	if xv>16		xsp=16;
	else if xv<-16	xsp=-16;
	else			xsp=xv;
}