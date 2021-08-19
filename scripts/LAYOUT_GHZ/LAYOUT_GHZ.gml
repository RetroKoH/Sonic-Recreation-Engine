function LAYOUT_GHZ(){
	chunks_count = 0;
	var t = 0, tx = 0, ty = 0;

	// For every 128x128 Chunk, we need to set collision tiles based on the chunk present
	for (var ix = 0; ix < room_width div 128; ix++)
		for (var iy = 0; iy < room_height div 128; iy++) {
			t = tilemap_get(chunks_id,ix,iy)
			if (t) {
				tx = ix*8; ty = iy*8;
				switch(t) {
					case 3:
						tilemap_set_mirrored(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$15,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 4:
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$14,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$15,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 5:
						tilemap_set(map_id,$10,tx+1,ty+7);
					break;
					case 7:
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1B,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1A,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$19,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$18,tx,ty); tx-=6; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set_mirrored(map_id,$1D,tx,ty); ty++;
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 167:
						ty+=4;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1A,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$15,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 168:
						ty+=4;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
				}
				chunks_count++;
			}
		}
}