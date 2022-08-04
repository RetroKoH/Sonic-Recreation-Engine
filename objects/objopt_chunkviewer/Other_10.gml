/// @description Draw out collision for given tile
for (var i = 0; i < 2; i++){
	tilemap_clear(map_id[i],0);
	scr_layout_GHZ(i,tile_index,9,4);
	show_debug_message("Collision Loaded");
}
