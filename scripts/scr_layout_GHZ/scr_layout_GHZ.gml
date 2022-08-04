// Collision layouts for GHZ tiles
function scr_layout_GHZ(plane,tile_ID,tile_x,tile_y){ 
	switch(tile_ID) {
		case 3:
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 4:
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 5:
			tilemap_set(map_id[plane],$110,tile_x+1,tile_y+7);
		break;
		case 7:
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11A,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$119,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$118,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 8:
			tile_y++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_x--; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11A,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$119,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$118,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(4) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 9:
			tile_x+=2; tile_y+=6;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=5; tile_y++;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 10:
			tile_y+=6;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=5; tile_y++;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 11:
			tile_y+=4;
			repeat(3) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$10A,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$109,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$113,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 12:
			tile_y+=4;
			tilemap_set(map_id[plane],$113,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$109,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$10A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 14:
			tile_x+=4; tile_y+=4;
			repeat(2) {
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
				tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			} tile_x-=4;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=4; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 15:
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 16:
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 17:
			tile_x+=6;
			tilemap_set_mirrored(map_id[plane],$110,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x-=3; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
			tilemap_set(map_id[plane],$1FF,tile_x+1,tile_y); tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=4; tile_y++
			repeat(4) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=4; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 18:
			tile_x+=3;
			tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$111,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$111,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$110,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 21:
			tile_x+=4;
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y++; }
			repeat(3) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 22:
		tile_y+=7;
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y--; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 23:
		case 24:
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 27:
			tile_x+=6;
			tilemap_set_flipped(map_id[plane],$6E,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--; tile_y++;
			tilemap_set_flipped(map_id[plane],$6F,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=2; tile_y++;
			tilemap_set_flipped(map_id[plane],$70,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FB,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=5; tile_y++;
			tilemap_set_flipped(map_id[plane],$73,tile_x,tile_y); tile_x++;
			tilemap_set_flipped(map_id[plane],$72,tile_x,tile_y); tile_x++;
			tilemap_set_flipped(map_id[plane],$71,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FB,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			repeat(3) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=5; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 28:
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 29:
			tile_x+=6; tile_y+=6;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
			tilemap_set(map_id[plane],$1FF,tile_x+1,tile_y);
			tilemap_set(map_id[plane],$FF,tile_x,tile_y+1);
			tilemap_set(map_id[plane],$1FF,tile_x+1,tile_y+1);
		break;
		case 30:
			tile_x+=2; tile_y+=4;
			repeat(2)
			{
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				repeat(4) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
				tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=5; tile_y++;
			} tile_x-=2;
			repeat(2) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=2; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
			tilemap_set(map_id[plane],$1FF,tile_x+1,tile_y);
		break;
		case 31:
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(5) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 33:
			tile_x+=4; tile_y+=1;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$10A,tile_x,tile_y); tile_x-=3; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(2) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=4; tile_y++;
			repeat(2) {
			repeat(3) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
				tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;}
		break;
		case 34:
			tile_y++;
			tilemap_set_mirrored(map_id[plane],$109,tile_x,tile_y); tile_x++;
			repeat(2) {tilemap_set(map_id[plane],$109,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$10A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 37:
			tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			repeat(3) {tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			repeat(2) {tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y++;}
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 38:
			tile_y+=4;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			repeat(3) {tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 41:
			tile_y++;
			repeat(6) {tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y++;}
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y-=6; tile_x++;
			repeat(5) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(5) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--; tile_y++;
			repeat(4){tilemap_set(map_id[plane],$FF,tile_x,tile_y);
				tilemap_set(map_id[plane],$FF,tile_x+1,tile_y); tile_y++;}
			tilemap_set(map_id[plane],$FF,tile_x+1,tile_y);
		break;
		case 47:
		case 48:
			tile_y+=4;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			repeat(2) {tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 51:
		case 52:
		case 192:
		case 193:
			tile_y+=4;
			repeat(2) {
				repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
				tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++; }
		break;
		case 53:
			tile_x+=2;
			tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$110,tile_x,tile_y); tile_x+=4;
			tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(2){ tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(6) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;}
			repeat(4) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 54:
			tilemap_set(map_id[plane],$111,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$111,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$110,tile_x,tile_y); tile_x+=3;
			repeat(2) { tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		// One duplicate chunk w/ no solidity removed
		case 60:
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(6) {tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;}
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(5) {tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_y++;}
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 61:
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 64:
		case 128:
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$10A,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$109,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$109,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 65:
		case 129:
			tilemap_set(map_id[plane],$109,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$10A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 71:
		case 75:
		case 83:
			tile_x+=5; tile_y++;
			tilemap_set(map_id[plane],$118,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$119,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11A,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 72:
		case 84:
			tile_x++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			repeat(6) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 73:
			tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 74:
			tile_y++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 76: //- slightly different collision from 72 and 84
			tile_x++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			repeat(6) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 79:
			tile_y+=4;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$10A,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 80:
		case 99:
			tile_y+=4;
			repeat(3) { tilemap_set(map_id[plane],$109,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$10A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 81:
			tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 82:
			tile_y++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
		break;
		case 85:
			tile_y+=4;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 95:
			tile_x+=6; tile_y+=2;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x--; tile_y++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 96:
			tile_x+=4;
			repeat(2) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++; } tile_x-=4;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=4; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 125:
			tile_x+=4; tile_y+=4;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 130:
			tile_y+=4;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$119,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$118,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 131:
			tile_y+=5;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_x-=2; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11A,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$119,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$118,tile_x,tile_y);
		break;
		case 133:
			tile_x+=3;
			repeat(4) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 135:
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
		break;
		case 138:
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(6) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 139:
			tile_y++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_x--; tile_y++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11C,tile_x,tile_y); tile_x--; tile_y++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set_mirrored(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=2; tile_y++;
			repeat(2) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 142:
			tile_x+=7; tile_y++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x-=2; tile_y++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=5; tile_y++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=6; tile_y++;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=5; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 143:
			tile_x++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			repeat(6) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 160:
			tile_x++;
			tilemap_set(map_id[plane],$110,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$110,tile_x,tile_y); tile_x-=2; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 167:
			tile_y+=4;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$115,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 168:
			tile_y+=4;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 176:
			tile_x+=6; tile_y+=3;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$11A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11A,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11B,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(5) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
		case 177:
			tile_x+=4;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$114,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$116,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=5; tile_y++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$11C,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$11D,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;

		// Loop tiles--------------------------------------------
		case 184:
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(4) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set_xy_flipped(map_id[plane],$FB,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$71,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$72,tile_x,tile_y); tile_x++;
			tilemap_set_mirrored(map_id[plane],$73,tile_x,tile_y);
			if plane = 1 {
				tile_x-=4; tile_y++;
				tilemap_set_xy_flipped(map_id[plane],$FB,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$70,tile_x,tile_y); tile_x-=2; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$6F,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$6E,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$6D,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set_xy_flipped(map_id[plane],$6D,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set_xy_flipped(map_id[plane],$6E,tile_x,tile_y); }
		break;
		case 185:
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=7; tile_y++;
			tilemap_set(map_id[plane],$73,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$72,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$71,tile_x,tile_y); tile_x++;
			tilemap_set(map_id[plane],$FD,tile_x,tile_y); tile_x++;
			repeat(3) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
			if plane = 0 {
				tile_x-=4; tile_y++;
				tilemap_set(map_id[plane],$70,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FD,tile_x,tile_y); tile_y++;
				tilemap_set(map_id[plane],$6F,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set(map_id[plane],$6E,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set(map_id[plane],$6D,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set_flipped(map_id[plane],$6D,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--; tile_y++;
				tilemap_set_flipped(map_id[plane],$6E,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); }
		break;
		case 186:
			tile_y+=4;
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
			if (plane == 0) {
				tile_x-=3; tile_y-=2;
				tilemap_set(map_id[plane],$64,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$65,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$66,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$67,tile_x,tile_y); }
			else if (plane == 1) {
				tile_x-=5; tile_y-=5;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set_xy_flipped(map_id[plane],$6F,tile_x,tile_y); tile_y++;
				tilemap_set(map_id[plane],$FC,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$6C,tile_x,tile_y); tile_y++;
				tilemap_set(map_id[plane],$FC,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$6B,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$6A,tile_x,tile_y); tile_x-=2; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$42,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$5E,tile_x,tile_y); }
		break;
		case 187:
			tile_y+=4;
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x-=7; tile_y++;
			repeat(7) { tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$FF,tile_x,tile_y);
			if (plane == 0) {
				tile_y-=5; tile_x-=2;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--;
				tilemap_set_flipped(map_id[plane],$6F,tile_x,tile_y); tile_y++;
				tilemap_set(map_id[plane],$FB,tile_x,tile_y); tile_x--;
				tilemap_set_flipped(map_id[plane],$70,tile_x,tile_y); tile_y++;
				tilemap_set(map_id[plane],$FB,tile_x,tile_y); tile_x--;
				tilemap_set(map_id[plane],$6B,tile_x,tile_y); tile_x--;
				tilemap_set(map_id[plane],$6A,tile_x,tile_y); tile_x+=2; tile_y++;
				tilemap_set(map_id[plane],$FF,tile_x,tile_y); tile_x--;
				tilemap_set(map_id[plane],$FB,tile_x,tile_y); tile_x--;
				tilemap_set(map_id[plane],$69,tile_x,tile_y); tile_x--;
				tilemap_set(map_id[plane],$68,tile_x,tile_y);
			}
			else if (plane == 1) {
				tile_x-=7; tile_y-=2;
				tilemap_set(map_id[plane],$5F,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$60,tile_x,tile_y); tile_x++;
				tilemap_set(map_id[plane],$62,tile_x,tile_y); tile_x++;
				tilemap_set_mirrored(map_id[plane],$64,tile_x,tile_y); }
		break;
		//-------------------------------------------------------
						
		case 189:
			tile_y+=4;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
						
		case 191:
			tile_x+=4;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x-=3; tile_y++;
			repeat(3) { tilemap_set(map_id[plane],$1FF,tile_x,tile_y); tile_x++; }
			tilemap_set(map_id[plane],$1FF,tile_x,tile_y);
		break;
	}
}
