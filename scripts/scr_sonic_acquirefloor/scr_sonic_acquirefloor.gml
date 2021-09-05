function scr_sonic_acquirefloor(){
	if (status&STA_PUSH) status^=STA_PUSH;			// Clear push status
	if (status&STA_INAIR) status^=STA_INAIR;		// Clear air status
	if (status&STA_ROLLJUMP) status^=STA_ROLLJUMP;	// Clear roll jump status
	if (status&STA_SPIN)			// If Sonic is spinning
	{
	    status^=STA_SPIN;			// Clear spin status
		y-=defaultHeight-height;
	    height=defaultHeight;
	    width=9;
	    anim_ID=anim_player.walk;
	}
	jump=0;
	// Clear item bonus
	anim_ID=anim_player.walk;
}