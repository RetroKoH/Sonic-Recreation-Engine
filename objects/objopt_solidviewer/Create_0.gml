/// @description Init Solid viewer
enabled = false;	// If false, cannot be seen or utilized
active = false;		// I need to remove these secondary flags.
index = 1;

// Collision tile surface
surface_tile=surface_create(16,16);
scr_debug_draw_tile(index);