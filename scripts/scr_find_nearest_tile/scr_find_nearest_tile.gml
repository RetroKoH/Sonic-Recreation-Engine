function scr_find_nearest_tile(tile_map_id, point_x, point_y){
	return tilemap_get_at_pixel(tile_map_id, point_x, point_y);
}