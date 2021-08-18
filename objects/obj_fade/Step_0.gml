/// @description Fading Routine
if (fading==true)
{
    switch(fade)
    {
        case 0: // INIT FADING
            fade=1;
        break;
        case 1: // FADING TO BLACK
            if fade_alpha!=1 fade_alpha+=.025;   // If not finished fading to black, continue.
            else
            {
                fade=2;         // Set to waiting phase.
                fade_wait=30;   // Set alarm to .5 seconds
            }
        break;
    
        case 2: // BRIEF WAIT TO PREPARE PAUSE SCREEN
            fade_wait-=1;           // Count down alarm.
            if fade_wait==0
            {
                fade=3;             // Set to fade in.
                
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

        case 3: // FADE FROM BLACK
            if fade_alpha!=0 fade_alpha-=.025;   // If not finished fading in from black, continue.
            else
            {
                fade=0;         // Clear fading status.
                fading=false;   // Officially unpaused now.
            }
        break;
    }
}
