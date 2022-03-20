// Subroutine pushing the player down a slope.
function scr_player_slope_repel(){
	if (convex) exit; // if on a convex wheel, exit
	if (move_lock) {move_lock-=1; exit;} // If horizontal movement is locked, decrement timer and exit.
    
	if angle<=315 && angle>=45 // if angle is not in Floor Mode
		if abs(gsp)<2.5
			{gsp=0; status|=STA_INAIR; move_lock=$1E;} // If you aren't moving fast enough, fall.
}