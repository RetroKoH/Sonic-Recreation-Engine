function tilemap_set_flipped(map,_n,_x,_y){
	tilemap_set(map,_n,_x,_y);
	var data = tilemap_get(map,_x,_y);
	var is = !tile_get_flip(data);
	data = tile_set_flip(data, is);
	tilemap_set(map, data, _x, _y);
}