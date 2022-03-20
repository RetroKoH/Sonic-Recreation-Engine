function scr_player_acquirefloor(){
	status&=~STA_PUSH;		// Clear push status
	status&=~STA_INAIR;		// Clear air status
	status&=~STA_ROLLJUMP;	// Clear roll jump status
	if (status&STA_SPIN)	// If Sonic is spinning
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