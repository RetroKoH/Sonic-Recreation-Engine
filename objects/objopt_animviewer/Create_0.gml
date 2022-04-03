/// @description Insert description here

image_speed = 0;
enabled = false;	// If false, cannot be utilized
active = false;		// IDK why we need two flags, but here we are.
anim_set = 0;		// The animation structure index to load scripts from (up/down)
anim_index = 0;		// The animation script index to play (left/right)
playing = false;	// If true, that means an animation is being played.

total = array_length(animation_index);	// Total number of animations to play
scr_init_anim(animation_index[0],0);	// Establish vars for first animation
anim_name = anim_table[anim_ID].name;	// Load text name for animation
max_index = array_length(anim_table);