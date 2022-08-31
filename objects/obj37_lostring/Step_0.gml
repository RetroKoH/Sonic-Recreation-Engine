/// @description Check if Ring is collected
if fading exit;
if routine==1 // If the ring hasn't been collected, it will move accordingly.
{
	var dist;
    // Apply X speed
    x+=xsp;
        
    // Bounce horizontally if it collides with walls
    dist = scr_get_left_wall_dist(-height, 0, 0);
	if (xsp < 0 && dist <= 0)
    {
        // Unstick from the wall
        x+=xsp;            
        // Bounce, losing strength (Based on Mercury's guide)
        xsp=xsp*-0.25;
    }
	dist = scr_get_right_wall_dist(height, 0, 0);
	if (xsp > 0 && dist <= 0)
    {
        // Unstick from the wall
        x-=xsp;            
        // Bounce, losing strength (Based on Mercury's guide)
        xsp=xsp*-0.25;
    }
    
    // Apply Y speed
    y+=ysp;
    ysp+=grv;                       // Apply gravity each step.
    
    // Bounce if it collides with the floor/ceiling.
    dist = scr_get_ceiling_dist(0, -height, 0);
	if (ysp < 0 && dist <= 0) {
        // Unstick from the floor
        y+=ysp;            
        // Bounce, losing strength
        ysp=ysp*-0.75;
    }
	dist = scr_get_floor_dist(0, height, 0);
	if (ysp > 0 && dist <= 0) {
        // Unstick from the floor
        y-=ysp;            
        // Bounce, losing strength
        ysp=ysp*-0.75;
    }
        
    time-=1;                        // Subtract 1 from the ring's life counter.
    if time==0 instance_destroy();  // If time hits 0, destroy the ring.
}

if routine==2 // If the ring has been collected, and has entered the collected routine,
{
    routine++;				// Set to the sparkle routine to happen next. The animation will change according to the routine.
	anim_ID++;				// Set animation
    scr_obj_priority(1);	// The drawing priority changes.
	scr_play_ring_sound();	// Play alternating ring sound.
    scr_collect_rings(1);	// Subroutine for collecting rings.
}

// routine==3 - Sparkle routine

if routine==4 // Sparkle routine, minus the collection
{
    routine--;			// Set to the sparkle routine to happen next. The animation will change according to the routine.
	anim_ID++;			// Set animation
    //scr_obj_priority(1);          // The drawing priority changes.
}