function scr_layout_init(){
	chunks_count = 0;
	var t = 0, tx = 0, ty = 0;

	// For every 128x128 Chunk, we need to set collision tiles based on the chunk present
	// This needs to be done twice, once for each collision plane
	for (var i = 0; i < 2; i++)
		for (var ix = 0; ix < room_width div 128; ix++)
			for (var iy = 0; iy < room_height div 128; iy++) {
				t = tilemap_get(chunks_id,ix,iy)
				if (t) {
					tx = ix*8; ty = iy*8;
					scr_layout_GHZ(i,t,tx,ty); // i=collision plane; t=tile ID; tx=tile_x; ty=tile_y;
					chunks_count++;
				}
			}
}