function scr_sonic_move_air(){
	if !(status&$10)  // If not in a rolling jump, we can change direction.
	{
	    if global.k_l_h  // Movement to the left
	    {
	        status|=1;    // Face left, setting Facing bit
	        if xsp>-topspeed  // If the character is moving slower than max speed to the left
	        {
	            xsp-=(accel_run*2);				// Accelerate to the left.
	            if xsp<-topspeed xsp=-topspeed;	// ONLY IF the character was moving slower than max speed to the left, set speed to max if it exceeds max.
	        }
	    }
	    if global.k_r_h	// Movement to the right
	    {
	        if (status&1) status^=1;   // Face right, clearing facing bit.
	        if xsp<topspeed   // If the character is moving slower than max speed to the right
	        {
	            xsp+=(accel_run*2);               // accelerate to the right.
	            if xsp>topspeed xsp=topspeed; // ONLY IF the character was moving slower than max speed to the right, set speed to max if it exceeds max.
	        }
	    }
	}
	// Air drag
	if (ysp<0 && ysp>-4) xsp-=(floor(xsp / 0.125)/256);
}