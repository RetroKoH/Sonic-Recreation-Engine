// This script will become a general level layout script
// Used in the actual levels for all chunks

// Edit this to pull from an array.
function scr_layout_init(_zone){
	var scr;
	switch(_zone)
	{
		case ZONE_GHZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_BZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_MZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_JZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_SYZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_LZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_SLZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_SBZ:
			scr = scr_layout_GHZ;
		break;
		case ZONE_SKBZ:
			scr = scr_layout_GHZ;
		break;
	}

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
					script_execute(scr,i,t,tx,ty); // i=collision plane; t=tile ID; tx=tile_x; ty=tile_y;
					chunks_count++;
				}
			}
}
