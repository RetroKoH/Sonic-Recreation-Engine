function LAYOUT_GHZ(){
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
					switch(t) {
						case 3:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 4:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 5:
							tilemap_set(map_id[i],$10,tx+1,ty+7);
						break;
						case 7:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1B,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1A,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$19,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$18,tx,ty); tx-=6; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 8:
							ty++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); tx--; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1B,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1A,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$19,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$18,tx,ty); tx-=3; ty++;
							repeat(4) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 9:
							tx+=2; ty+=6;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 10:
							ty+=6;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 11:
							ty+=4;
							repeat(3) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$A,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],9,tx,ty); tx++;
							tilemap_set(map_id[i],$13,tx,ty); tx-=7; ty++;
							repeat(7) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 12:
							ty+=4;
							tilemap_set(map_id[i],$13,tx,ty); tx++;
							tilemap_set(map_id[i],9,tx,ty); tx++;
							tilemap_set(map_id[i],$A,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							repeat(2) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 14:
							tx+=4; ty+=4;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(4) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=4; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 15:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 16:
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 17:
							tx+=6;
							tilemap_set_mirrored(map_id[i],$10,tx,ty); tx++;
							tilemap_set(map_id[i],$10,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
							tilemap_set(map_id[i],$FF,tx+1,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=4; ty++
							repeat(4) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=4; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 18:
							tx+=3;
							tilemap_set(map_id[i],$10,tx,ty); tx++;
							tilemap_set(map_id[i],$11,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$11,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$10,tx,ty); tx-=6; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 21:
							tx+=4;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); ty++; }
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 22:
						ty+=7;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); ty--; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 23:
						case 24:
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 27:
							tx+=6;
							tilemap_set_flipped(map_id[i],$6E,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx--; ty++;
							tilemap_set_flipped(map_id[i],$6F,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=2; ty++;
							tilemap_set_flipped(map_id[i],$70,tx,ty); tx++;
							tilemap_set(map_id[i],$FB,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							tilemap_set_flipped(map_id[i],$73,tx,ty); tx++;
							tilemap_set_flipped(map_id[i],$72,tx,ty); tx++;
							tilemap_set_flipped(map_id[i],$71,tx,ty); tx++;
							tilemap_set(map_id[i],$FB,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=6; ty++;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 28:
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++
							tilemap_set(map_id[i],$15,tx,ty); tx++
							tilemap_set(map_id[i],$16,tx,ty); tx++
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 29:
							tx+=6; ty+=6;
							tilemap_set(map_id[i],$FF,tx,ty);
							tilemap_set(map_id[i],$FF,tx+1,ty);
							tilemap_set(map_id[i],$FF,tx,ty+1);
							tilemap_set(map_id[i],$FF,tx+1,ty+1);
						break;
						case 30:
							tx+=2; ty+=4;
							repeat(2)
							{
								repeat(5) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
								tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							} tx-=2;
							repeat(2) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty); tx-=2; ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
							tilemap_set(map_id[i],$FF,tx+1,ty);
						break;
						case 31:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=6; ty++;
							repeat(5) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 33:
							tx+=4; ty+=1;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$A,tx,ty); tx-=3; ty++;
							repeat(3) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=4; ty++;
							repeat(2) {
							repeat(3) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
								tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;}
						break;
						case 34:
							ty++;
							tilemap_set_mirrored(map_id[i],9,tx,ty); tx++;
							repeat(2) {tilemap_set(map_id[i],9,tx,ty); tx++;}
							tilemap_set(map_id[i],$A,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 37:
							ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							repeat(3) {tilemap_set(map_id[i],$15,tx,ty); tx++;}
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							repeat(2) {tilemap_set(map_id[i],$FF,tx,ty); ty++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 38:
							ty+=4;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							repeat(3) {tilemap_set(map_id[i],$15,tx,ty); tx++;}
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 47:
						case 48:
							ty+=4;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							repeat(2) {tilemap_set(map_id[i],$15,tx,ty); tx++;}
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 51:
						case 52:
						case 192:
						case 193:
							ty+=4;
							repeat(2) {
								repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
								tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++; }
						break;
						case 53:
							tx+=2;
							tilemap_set(map_id[i],$10,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$10,tx,ty); tx+=4;
							tilemap_set(map_id[i],$10,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(4) { tilemap_set(map_id[i],$FF,tx,ty); ty++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 54:
							tilemap_set(map_id[i],$11,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$11,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$10,tx,ty); tx+=3;
							repeat(2) { tilemap_set(map_id[i],$10,tx,ty); tx++; }
							tilemap_set(map_id[i],$10,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 60:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) {tilemap_set(map_id[i],$FF,tx,ty); tx++;}
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(5) {tilemap_set(map_id[i],$FF,tx,ty); ty++;}
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 61:
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 64:
						case 128:
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$A,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],9,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],9,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 65:
						case 129:
							tilemap_set(map_id[i],9,tx,ty); tx++;
							tilemap_set(map_id[i],$A,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 71:
							tx+=5; ty++;
							tilemap_set(map_id[i],$18,tx,ty); tx++;
							tilemap_set(map_id[i],$19,tx,ty); tx++;
							tilemap_set(map_id[i],$1A,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 72:
							tx++;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$1D,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$1B,tx,ty); tx++;
							repeat(6) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 73:
							ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 74:
							ty++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							repeat(2) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 79:
							ty+=4;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$A,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 80:
						case 99:
							ty+=4;
							repeat(3) { tilemap_set(map_id[i],9,tx,ty); tx++; }
							tilemap_set(map_id[i],$A,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 85:
							ty+=4;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 95:
							tx+=6; ty+=2;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx--; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=6; ty++;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 96:
							tx+=4;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=4; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 125:
							tx+=4; ty+=4;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 130:
							ty+=4;
							repeat(2) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$19,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$18,tx,ty); tx-=6; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 131:
							ty+=5;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); tx-=2; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$1B,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1A,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$19,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$18,tx,ty);
						break;
						case 133:
							tx+=3;
							repeat(4) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 189:
							ty+=4;
						case 135:
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 138:
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$14,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); tx-=6; ty++;
							repeat(6) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 139:
							ty++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); tx--; ty++;
							repeat(2) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$1D,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1C,tx,ty); tx--; ty++;
							repeat(2) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_mirrored(map_id[i],$1B,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=2; ty++;
							repeat(2) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 142:
							tx+=7; ty++;
							tilemap_set(map_id[i],$1C,tx,ty); tx-=2; ty++;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$1D,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$1D,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=6; ty++;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 143:
							tx++;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$1D,tx,ty); tx++;
							repeat(6) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 160:
							tx++;
							tilemap_set(map_id[i],$10,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$10,tx,ty); tx-=2; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 167:
							ty+=4;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$15,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1A,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$15,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 168:
							ty+=4;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 176:
							tx+=6; ty+=3;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$1D,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$16,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$1A,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$1A,tx,ty); tx++;
							tilemap_set(map_id[i],$1B,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(5) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
						case 177:
							tx+=4;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$14,tx,ty); tx++;
							tilemap_set(map_id[i],$16,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=5; ty++;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$1D,tx,ty); tx++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$1C,tx,ty); tx++;
							tilemap_set(map_id[i],$1D,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							tilemap_set(map_id[i],$FF,tx,ty); tx++;
							tilemap_set(map_id[i],$FF,tx,ty);
						break;

						// Loop tiles--------------------------------------------
						case 184:
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(4) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set_xy_flipped(map_id[i],$FB,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$71,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$72,tx,ty); tx++;
							tilemap_set_mirrored(map_id[i],$73,tx,ty);
							if i = 1 {
								tx-=4; ty++;
								tilemap_set_xy_flipped(map_id[i],$FB,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$70,tx,ty); tx-=2; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$6F,tx,ty); tx--; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$6E,tx,ty); tx--; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$6D,tx,ty); tx--; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set_xy_flipped(map_id[i],$6D,tx,ty); tx--; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set_xy_flipped(map_id[i],$6E,tx,ty); }
						break;
						case 185:
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							tilemap_set(map_id[i],$73,tx,ty); tx++;
							tilemap_set(map_id[i],$72,tx,ty); tx++;
							tilemap_set(map_id[i],$71,tx,ty); tx++;
							tilemap_set(map_id[i],$FD,tx,ty); tx++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
							if i = 0 {
								tx-=4; ty++;
								tilemap_set(map_id[i],$70,tx,ty); tx++;
								tilemap_set(map_id[i],$FD,tx,ty); ty++;
								tilemap_set(map_id[i],$6F,tx,ty); tx++;
								tilemap_set(map_id[i],$FF,tx,ty); tx--; ty++;
								tilemap_set(map_id[i],$6E,tx,ty); tx++;
								tilemap_set(map_id[i],$FF,tx,ty); tx--; ty++;
								tilemap_set(map_id[i],$6D,tx,ty); tx++;
								tilemap_set(map_id[i],$FF,tx,ty); tx--; ty++;
								tilemap_set_flipped(map_id[i],$6D,tx,ty); tx++;
								tilemap_set(map_id[i],$FF,tx,ty); tx--; ty++;
								tilemap_set_flipped(map_id[i],$6E,tx,ty); tx++;
								tilemap_set(map_id[i],$FF,tx,ty); }
						break;
						case 186:
							ty+=4;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
							if (i == 0) {
								tx-=3; ty-=2;
								tilemap_set(map_id[i],$64,tx,ty); tx++;
								tilemap_set(map_id[i],$65,tx,ty); tx++;
								tilemap_set(map_id[i],$66,tx,ty); tx++;
								tilemap_set(map_id[i],$67,tx,ty); }
							else if (i == 1) {
								tx-=5; ty-=5;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set_xy_flipped(map_id[i],$6F,tx,ty); ty++;
								tilemap_set(map_id[i],$FC,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$6C,tx,ty); ty++;
								tilemap_set(map_id[i],$FC,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$6B,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$6A,tx,ty); tx-=2; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set(map_id[i],$FF,tx,ty); tx++;
								tilemap_set(map_id[i],$42,tx,ty); tx++;
								tilemap_set(map_id[i],$5E,tx,ty); }
						break;
						case 187:
							ty+=4;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=7; ty++;
							repeat(7) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
							if (i == 0) {
								ty-=5; tx-=2;
								tilemap_set(map_id[i],$FF,tx,ty); tx--;
								tilemap_set_flipped(map_id[i],$6F,tx,ty); ty++;
								tilemap_set(map_id[i],$FB,tx,ty); tx--;
								tilemap_set_flipped(map_id[i],$70,tx,ty); ty++;
								tilemap_set(map_id[i],$FB,tx,ty); tx--;
								tilemap_set(map_id[i],$6B,tx,ty); tx--;
								tilemap_set(map_id[i],$6A,tx,ty); tx+=2; ty++;
								tilemap_set(map_id[i],$FF,tx,ty); tx--;
								tilemap_set(map_id[i],$FB,tx,ty); tx--;
								tilemap_set(map_id[i],$69,tx,ty); tx--;
								tilemap_set(map_id[i],$68,tx,ty);
							}
							else if (i == 1) {
								tx-=7; ty-=2;
								tilemap_set(map_id[i],$5F,tx,ty); tx++;
								tilemap_set(map_id[i],$60,tx,ty); tx++;
								tilemap_set(map_id[i],$62,tx,ty); tx++;
								tilemap_set_mirrored(map_id[i],$64,tx,ty); }
						break;
						//-------------------------------------------------------
						
						case 191:
							tx+=4;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty); tx-=3; ty++;
							repeat(3) { tilemap_set(map_id[i],$FF,tx,ty); tx++; }
							tilemap_set(map_id[i],$FF,tx,ty);
						break;
					}
					chunks_count++;
				}
			}
}