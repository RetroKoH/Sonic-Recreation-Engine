/// @description Init Swinging Chain
image_speed=0;
scr_obj_priority(3);
routine=0;
angle=0;
subtype=0;
pieces = [];	// Chain links and main object stored in this array
orig_x=x;
orig_y=y;
dist=0;			// Anchor will have a dist of 0. Other pieces will have increased distance.