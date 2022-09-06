/// @description Chopper Routine
y+=ysp;                         // Apply speed to the badnik's y-position
ysp+=.09375;                    // Reduce speed

if y>=original_y
{
    y=original_y     // Set Chopper at this position.
    ysp=-7;          // Reset speed
    image_speed=1/8; // Set animation speed
}

if y<original_y-192 && ysp!=0         image_speed=1/4;
if (y>original_y-192 && sign(ysp)=1) {image_index=0;      image_speed=0;}
