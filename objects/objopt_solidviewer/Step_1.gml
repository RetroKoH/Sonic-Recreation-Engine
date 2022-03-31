/// @description Surface check
if !surface_exists(surface_tile) {
	surface_tile=surface_create(16,16);
	scr_debug_draw_tile(index);
}