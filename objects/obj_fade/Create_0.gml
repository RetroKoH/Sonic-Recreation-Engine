/// @description Init Fading effect for use
globalvar fading;

depth=-100;
fading=false;   // A global lock that occurs when fading occurs.
fade=0;         // Fade routine
fade_alpha=0;   // Alpha transparency for the fade screen.
fade_wait=0;    // Wait time before fading from black.
goto=-1;        // Room to go to after fading.

// Fade surface - Will be drawn only when fading
surface_fade=surface_create(1,1);
surface_set_target(surface_fade);
draw_point_colour(0,0,c_white);
surface_reset_target();
