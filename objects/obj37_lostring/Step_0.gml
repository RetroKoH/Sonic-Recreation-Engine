/// @description Check if Ring is collected
if fading exit;
if routine==1 // If the ring hasn't been collected, it will move accordingly.
{
    // Apply X speed
    x+=xsp;
        
    /* Bounce horizontally if it collides with walls
    if ((xsp>0 && place_meeting(x,y,obj00_Solid)) || (xsp<0&&place_meeting(x,y,obj00_Solid)))
    {
        // Unstick from the wall
        x-=xsp;            
        // Bounce, losing strength (Based on Mercury's guide)
        xsp=xsp*-0.25;
    }*/
    
    // Apply Y speed
    y+=ysp;
    ysp+=grv;                       // Apply gravity each step.
    
    /* Bounce if it collides with the floor/ceiling.
    if ((ysp>0 && place_meeting(x,y,obj00_Solid)) || (ysp<0 && place_meeting(x,y,obj00_Solid)))
    {
        // Unstick from the wall
        y-=ysp;            
        // Bounce, losing strength
        ysp=ysp*-0.75;
    }*/
        
    time-=1;                        // Subtract 1 from the ring's life counter.
    if time==0 instance_destroy();  // If time hits 0, destroy the ring.
}

if routine==2 // If the ring has been collected, and has entered the collected routine,
{
    routine++;               // Set to the sparkle routine to happen next. The animation will change according to the routine.
    depth=1;                 // The drawing priority changes.
    scr_collect_rings(1);    // Subroutine for collecting rings.
}