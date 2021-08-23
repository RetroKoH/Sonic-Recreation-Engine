function scr_sonic_acquirefloor(){
	if (status&STA_PUSH) status^=STA_PUSH;			// Clear push status
	if (status&STA_INAIR) status^=STA_INAIR;		// Clear air status
	if (status&STA_ROLLJUMP) status^=STA_ROLLJUMP;	// Clear roll jump status
	if (status&STA_SPIN)			// If Sonic is spinning
	{
	    status^=STA_SPIN;			// Clear spin status
	    height=$13;
	    width=9;
	    //anim_ID=anim_player.walk;
	    y-=5;
	}
	jump=0;
	// Clear item bonus
	anim_ID=anim_player.walk;
        
	// Set speeds upon reaquisition with the floor
	//if (relative_angle>=338 && relative_angle<=359) // If 
	//|| (relative_angle>=0 && relative_angle<=22)    // If angle is in the range of 0-22 or 338-359
	if (angle>=338 && angle<=359) // If 
	|| (angle>=0 && angle<=22)    // If angle is in the range of 0-22 or 338-359
	{
	    ysp=0;
	    gsp=xsp;
	}
}