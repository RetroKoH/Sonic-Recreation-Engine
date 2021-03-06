// Subroutine enabling the character to roll.
function scr_player_roll(){
	if abs(gsp)>=1.03125 // If absolute gsp is past a certain threshold
	{
		if !(global.k_l_h && global.k_r_h) && global.k_d_h // and down is being held without the left/right keys
		{
		    if !(status&STA_SPIN)			// If we are not already rolling (Rolling bit cleared)
		    {
		        status|=STA_SPIN;			// Set Rolling bit
		        height=$E;					// Set collision radius
		        width=7;
		        anim_ID=anim_player.roll;
		        y+=defaultHeight-height;	// Reposition character according to height change
		        audio_play_sound(S2_3E_Roll,1,false);
		        if (gsp==0)  gsp += 2;		// To prevent getting stuck in S tunnels, and the like.
		    }
		}
	}
}