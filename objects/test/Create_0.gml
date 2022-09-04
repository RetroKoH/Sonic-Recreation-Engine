/// @description Insert description here
// You can write your code in this editor

osc_a=.5;		// Actual value. Starts at this baseline.
osc_b=0;		// Value that "a" is increased/decreased by.
inc=.03125;		// Amount that "b" increments by.
lim=2;			// polarity is reversed when "b" reaches this value.
pol=1;			// polarity of var "b".

base_x = (room_width/2);
base_y = (room_height/2)-$30;