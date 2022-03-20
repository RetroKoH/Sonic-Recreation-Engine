function tilemap_set_mirrored(map,_n,_x,_y){
	tilemap_set(map,_n,_x,_y);			// Sets tile
	var data = tilemap_get(map,_x,_y);	// {data} = tiledata
	var is = !tile_get_mirror(data);	// {is} = tile's mirror status
	data = tile_set_mirror(data, is);	// {data} = mirrored tile
	tilemap_set(map, data, _x, _y);		// Sets updated tile
}

function tilemap_set_flipped(map,_n,_x,_y){
	tilemap_set(map,_n,_x,_y);			// Sets tile
	var data = tilemap_get(map,_x,_y);	// {data} = tiledata
	var is = !tile_get_flip(data);		// {is} = tile's flip status
	data = tile_set_flip(data, is);		// {data} = flipped tile
	tilemap_set(map, data, _x, _y);		// Sets updated tile
}

function tilemap_set_xy_flipped(map,_n,_x,_y){
	tilemap_set(map,_n,_x,_y);			// Sets tile
	var data = tilemap_get(map,_x,_y);	// {data} = tiledata
	var is = !tile_get_mirror(data);	// {is} = tile's mirror status
	data = tile_set_mirror(data, is);	// {data} = mirrored tile
	is = !tile_get_flip(data);			// {is} = tile's flip status
	data = tile_set_flip(data, is);		// {data} = flipped tile
	tilemap_set(map, data, _x, _y);		// Sets updated tile
}