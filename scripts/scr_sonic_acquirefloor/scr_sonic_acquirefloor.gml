function scr_sonic_acquirefloor(){
	if (status&STA_PUSH) status^=STA_PUSH;			// Clear push status
	if (status&STA_INAIR) status^=STA_INAIR;		// Clear air status
	if (status&STA_ROLLJUMP) status^=STA_ROLLJUMP;	// Clear roll jump status
	if (status&STA_SPIN)			// If Sonic is spinning
	{
	    status^=STA_SPIN;			// Clear spin status
	    height=$13;
	    width=9;
	    anim_ID=anim_player.walk;
	    y-=5;
	}
	jump=0;
	// Clear item bonus
	anim_ID=anim_player.walk;
        
	// Set speeds upon reaquisition with the floor
	if angle >= 339 || angle <= 23
	{
	    ysp = 0;
	    gsp = xsp;
	}
	else if angle >= 316 || angle <= 45
	{
		if (abs(xsp) > ysp) gsp = xsp;
		else gsp = ysp*0.5*-sign(sin(degtorad(angle)));
		ysp = 0;
	}
	else if angle >= 271 || angle <= 90
	{
		if (abs(xsp) > ysp) gsp = xsp;
		else gsp = ysp*-sign(sin(degtorad(angle)));
		ysp = 0;
	}
	// Set speeds upon reaquisition with the ceiling
	else if angle >= 226 || angle <= 135
	{
		gsp = ysp*-sign(sin(degtorad(angle)));
		ysp = 0
	}
	// Should not reattach @ angles 136-225
	else
	{
		ysp = 0;
	}
}