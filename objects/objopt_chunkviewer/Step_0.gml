/// @description Chunk Viewing
if !enabled exit;

/*if global.k_u_p {
	tileset--;
	if (tileset == -1) tileset = total-1;
	tile_index = 0;							// Reset index
	max_index = array_length(anim_table);	// Get the total number of animations in the set
}
if global.k_d_p {
	tileset++
	if (tileset == total) tileset = 0;
	tile_index = 0;							// Reset index
	max_index = array_length(anim_table);	// Get the total number of animations in the set
			                                                                                                                                                        // Get the total number of animations in the set
}*/
if global.k_l_p {
	tile_index--;
	if (tile_index == -1) tile_index = max_index-1;
	event_user(0);	// Apply tiles to new chunk
}
if global.k_r_p {
	tile_index++;
	if (tile_index == max_index) tile_index = 0;
	event_user(0);	// Apply tiles to new chunk
}

if keyboard_check_pressed(vk_escape)
	enabled = false;
