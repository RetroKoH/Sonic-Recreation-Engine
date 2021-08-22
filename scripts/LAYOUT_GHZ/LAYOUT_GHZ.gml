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
					case 8:
						ty++;
						tilemap_set_mirrored(map_id,$1C,tx,ty); ty++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1D,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1C,tx,ty); tx--; ty++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1B,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1A,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$19,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$18,tx,ty); tx-=3; ty++;
						repeat(4)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); ty++;
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 9:
						tx+=2; ty+=6;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=5; ty++;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 10:
						ty+=6;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=5; ty++;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 11:
						ty+=4;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$A,tx,ty); tx++;
						tilemap_set_mirrored(map_id,9,tx,ty); tx++;
						tilemap_set(map_id,$13,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 12:
						ty+=4;
						tilemap_set(map_id,$13,tx,ty); tx++;
						tilemap_set(map_id,9,tx,ty); tx++;
						tilemap_set(map_id,$A,tx,ty); tx++;
						tilemap_set(map_id,$15,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx++;
						repeat(2)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 14:
						tx+=4; ty+=4;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=3; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(4)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=4; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 15:
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 16:
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 17:
						tx+=6;
						tilemap_set_mirrored(map_id,$10,tx,ty); tx++;
						tilemap_set(map_id,$10,tx,ty); tx-=3; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=3; ty++;
						tilemap_set(map_id,$FF,tx,ty);
						tilemap_set(map_id,$FF,tx+1,ty); ty++;
						tilemap_set(map_id,$FF,tx,ty); tx-=4; ty++
						repeat(4)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=4; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 18:
						tx+=3;
						tilemap_set(map_id,$10,tx,ty); tx++;
						tilemap_set(map_id,$11,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$11,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$10,tx,ty); tx-=6; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 21:
						tx+=4;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); ty++; }
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 22:
					ty+=7;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); ty--; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 23:
					case 24:
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 27:
						tx+=6;
						tilemap_set_flipped(map_id,$6E,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx--; ty++;
						tilemap_set_flipped(map_id,$6F,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=2; ty++;
						tilemap_set_flipped(map_id,$70,tx,ty); tx++;
						tilemap_set(map_id,$FB,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=5; ty++;
						tilemap_set_flipped(map_id,$73,tx,ty); tx++;
						tilemap_set_flipped(map_id,$72,tx,ty); tx++;
						tilemap_set_flipped(map_id,$71,tx,ty); tx++;
						tilemap_set(map_id,$FB,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=6; ty++;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=5; ty++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 28:
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++
						tilemap_set(map_id,$15,tx,ty); tx++
						tilemap_set(map_id,$16,tx,ty); tx++
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 53:
						tx+=2;
						tilemap_set(map_id,$10,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$10,tx,ty); tx+=4;
						tilemap_set(map_id,$10,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(4)
						{ tilemap_set(map_id,$FF,tx,ty); ty++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 54:
						tilemap_set(map_id,$11,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$11,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$10,tx,ty); tx+=3;
						repeat(2)
						{ tilemap_set(map_id,$10,tx,ty); tx++; }
						tilemap_set(map_id,$10,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 60:
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$15,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); ty++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 61:
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$14,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$15,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 64:
						repeat(2)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$15,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$A,tx,ty); tx++;
						tilemap_set_mirrored(map_id,9,tx,ty); tx++;
						tilemap_set_mirrored(map_id,9,tx,ty); tx-=7; ty++
						repeat(7)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 135:
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=3; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 160:
						tx++;
						tilemap_set(map_id,$10,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$10,tx,ty); tx-=2; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=3; ty++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
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
					case 176:
						tx+=6; ty+=3;
						tilemap_set(map_id,$1C,tx,ty); tx++;
						tilemap_set(map_id,$1D,tx,ty); tx-=7; ty++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$16,tx,ty); tx++;
						tilemap_set_mirrored(map_id,$1A,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$1A,tx,ty); tx++;
						tilemap_set(map_id,$1B,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						repeat(5)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty);
					break;
					case 177:
						tx+=4;
						tilemap_set(map_id,$1C,tx,ty); tx++;
						tilemap_set(map_id,$14,tx,ty); tx++;
						tilemap_set(map_id,$16,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=5; ty++;
						tilemap_set(map_id,$1C,tx,ty); tx++;
						tilemap_set(map_id,$1D,tx,ty); tx++;
						repeat(3)
						{ tilemap_set(map_id,$FF,tx,ty); tx++; }
						tilemap_set(map_id,$FF,tx,ty); tx-=7; ty++;
						tilemap_set(map_id,$1C,tx,ty); tx++;
						tilemap_set(map_id,$1D,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty); tx-=3; ty++;
						tilemap_set(map_id,$FF,tx,ty); tx++;
						tilemap_set(map_id,$FF,tx,ty);
					break;
				}
				chunks_count++;
			}
		}
}