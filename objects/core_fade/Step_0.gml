/// @description Fading Routine
if (fading==true)
{
    switch(fade)
    {
        case 0: // INIT FADING
            fade++;
        break;
        case 1: // FADING TO BLACK
            if fade_alpha!=1 fade_alpha+=.025;   // If not finished fading to black, continue.
            else
            {
                fade++;         // Set to waiting phase.
                fade_wait=30;   // Set alarm to .5 seconds
            }
        break;
    
        case 2: // BRIEF WAIT TO PREPARE PAUSE SCREEN
            fade_wait-=1;           // Count down alarm.
            if fade_wait==0
            {
                fade++;					// Set to fade in.
				if !(load_card) fade++	// Skip title card if not needed.
                // Warp to a room, or at least to the correct coordinate.
                if (goto!=-1)
                    room_goto(goto);
                else
                {
                    //x=saved_x_pos;
                    //y=saved_y_pos;
                }
            }
        break;

        case 3: // Load Title Card
			if (load_card) instance_create_depth(0,0,depth-1,obj34_TitleCard);
			fade++;
		break;

		case 4: // FADE FROM BLACK (Title card will trigger fade in, if there is one)
		if !(load_card) {
	        if fade_alpha!=0 fade_alpha-=.025;   // If not finished fading in from black, continue.
	        else
	        {
	            fade=0;         // Clear fading status.
	            fading=false;   // Officially unpaused now.
	        }
		}
        break;
    }
}
