// Set values for synchronized animations.
function scr_sync_anim(){
	// GHZ Spiked Log Timer. Set this to only occur if in Green Hill Zone.
	if sync0_time==0    // Check timer
	{
	    sync0_time=$B; // Reset timer if needed.
	    if sync0_frame==0 sync0_frame=7; else sync0_frame-=1; // Max frame is 7. This counts down.
	}
	else sync0_time-=1; // If timer isn't reset, it counts down

	// Rings and Giant Rings
	if sync1_time==0    // Check timer
	{
	    sync1_time=7; // Reset timer if needed.
	    if sync1_frame==3 sync1_frame=0; else sync1_frame+=1; // Max frame is 3. This counts up.
	}
	else sync1_time-=1; // If timer isn't reset, it counts down
}