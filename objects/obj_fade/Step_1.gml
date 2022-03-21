/// @description Surface check
if !surface_exists(surface_fade) {
	surface_fade=surface_create(1,1);
	surface_set_target(surface_fade);
	draw_point_colour(0,0,c_white);
	surface_reset_target();
}