function scr_player_move_air(){
	if !(status&STA_ROLLJUMP)  // If not in a rolling jump, we can change direction.
	{
		var move=(global.k_r_h - global.k_l_h);	// Movement based on key control.
	    if move == -1	// Movement to the left
	    {
	        status|=STA_FACING;	// Face left, setting Facing bit
	        if xsp>-topspeed	// If the character is moving slower than max speed to the left
	        {
	            xsp-=(accel_run*2);				// Accelerate to the left.
	            if xsp<-topspeed xsp=-topspeed;	// ONLY IF the character was moving slower than max speed to the left, set speed to max if it exceeds max.
	        }
	    }
	    if move == 1	// Movement to the right
	    {
	        status&=~STA_FACING;	// Face right, clearing facing bit.
	        if xsp<topspeed			// If the character is moving slower than max speed to the right
	        {
	            xsp+=(accel_run*2);				// accelerate to the right.
	            if xsp>topspeed xsp=topspeed;	// ONLY IF the character was moving slower than max speed to the right, set speed to max if it exceeds max.
	        }
	    }
	}
	if (ysp<0 && ysp>-4) xsp-=(floor(xsp / 0.125)/256);		// Air drag
}