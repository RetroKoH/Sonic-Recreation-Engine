function scr_ring_loss(num_rings,off_x,off_y){
	var ring_counter = 0, ringHandle = -1, speeds;

	// Perform loop while the ring counter is less than number of lost rings
	while (ring_counter < num_rings)
	{
		// Spawn ring
		ringHandle = instance_create_layer(off_x,off_y,"Instances",obj37_LostRing);
		speeds = ringspeed[ring_counter];
	    ringHandle.xsp = speeds[0];
	    ringHandle.ysp = speeds[1];
		ringHandle.time = 256;
		
		ring_counter++; // increment ring counter
	}
}

/*function scr_ring_loss(num_rings,off_x,off_y){
	var ring_counter = 0;
	var ring_angle = 101.25; // 101.25° (184) ($B8)  // assuming 0=right, 90=up, 180=left, 270=down
	var flip = false;
	var spd = 4;
	var ringHandle = -1;
 
	// perform loop while the ring counter is less than number of lost rings
	while (ring_counter < num_rings)
	{
	    // create the ring
	    ringHandle = instance_create_layer(off_x,off_y,"Instances",obj37_LostRing);
	    ringHandle.xsp = cos(degtorad(ring_angle)) * spd;
	    ringHandle.ysp = -sin(degtorad(ring_angle)) * spd;
		ringHandle.time = 256;
    
	    // every ring created will moving be at the same angle as the other in the current pair, but flipped the other side of the circle
	    if (flip)
	    {
	        ringHandle.xsp *= -1;  // reverse ring's x speed
	        ring_angle += 22.5; //22.5° (240) ($F0)  // we increment angle on every other ring which makes 2 even rings either side
	    }
		
		// Note trajectory so that we can pull precooked values instead
		show_debug_message("ringspeed["+string(ring_counter)+"] = ["+string(ringHandle.xsp)+","+string(ringHandle.ysp)+"]");
    
	    // toggle flip
	    flip = !flip;  // if flip is false, flip becomes true and vice versa
    
	    // increment counter
	    ring_counter++;
    
	    // if we are halfway, start second "circle" of rings with lower speed
	    if (ring_counter == 16)
	    {
	        spd = 2
	        ring_angle = 101.25; // 101.25° (184) ($B8)  // assuming 0=right, 90=up, 180=left, 270=down
	    }
	}
}*/