function scr_sonic_roll(){
	// Subroutine enabling Sonic to roll.
	if abs(gsp)>=1.03125 // If absolute gsp is past a certain threshold
	{
		if !(global.k_l_h && global.k_r_h) && global.k_d_h // and down is being held without the left/right keys
		{
		    if !(status&4) // If we are not already rolling (Rolling bit cleared)
		    {
		        status|=4;    // Set Rolling bit
		        height=$E;    // Set collision radius
		        width=7;
		        anim_ID=anim_player.roll;
		        y+=5;               // Pop Sonic's center 5 pixels down to accomodate for the size change.
		        //sound_play(sndBE_Roll);
		        if gsp == 0 gsp += 2;   // To prevent getting stuck in S tunnels, and the like.
		    }
		}
	}
}