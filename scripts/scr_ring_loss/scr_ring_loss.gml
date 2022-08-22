function scr_ring_loss(num_rings,off_x,off_y){
	// The subroutine for losing rings when getting hurt. Need to fix ring speed/direction in accordance with SPG.

	var angle, stepBetweenRings, steps, ringHandle, ringsInRow, i;
	angle=0;
      
	// Reject if we aren't going to create any rings, otherwise, there would be a division
	// by zero on calculating the step angle.
	if (num_rings==0) exit;

	// Since only 16 rings can be thrown in one row, check out how many rows of rings there will be.
	// 1-16 is one row. 17-32 is 2 rows.
	steps=ceil(num_rings/16);

	// And now, create the rings. i is each row of rings.
	for (i=1;i<=steps;i+=1)
	{
	    // Set the angle to 0, that way we'll start over.
	    angle=0;
	    // Calculate how many rings will be thrown in this row, for later use. Up to 16 per row
	    ringsInRow=min(16,num_rings);
                
	    // And now, since the rings are fired into 16 directions, calculate the angle step between
	    // each direction, depending on how many rings would be thrown. Also, calculate them in radians
	    // for speeding up the calculations.
	    stepBetweenRings = degtorad(360/ringsInRow); // Of course, transform into radians
                
	    // Now, repeat the creation sequence the necessary amount of times.
	    repeat (ringsInRow)
	    {
	        // Create a new rings instance and get it's id.
	        ringHandle      = instance_create_layer(off_x,off_y,"Instances",obj37_LostRing);       
	        // Setup motion of the ring.
	        //ringHandle.mot  = true;                // Yeah, the ring is in movement
	        ringHandle.xsp  = cos(angle)*(4/(i));  // Thrown at a lower speed depending
	        ringHandle.ysp  = -sin(angle)*(4/(i)); // on the actual row of rings.
	        ringHandle.time = 256;                 // The amount of time rings will exist.
	        // And now, go to the next angle
	        angle += stepBetweenRings;
	        // Substract one to the total rings to lose count.
	        num_rings-=1;
	        if (!num_rings) exit; // If there are no more rings, exit.
	    }
	}
}