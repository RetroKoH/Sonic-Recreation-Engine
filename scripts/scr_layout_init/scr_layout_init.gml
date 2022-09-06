// This script will become a general level layout script
// Used in the actual levels for all chunks

// Edit this to pull from an array.
function scr_layout_init(_zone){
	var dat_layout, dat_aniart;
	switch(_zone)
	{
		case ZONE_GHZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_BZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_MZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_JZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_SYZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_LZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_SLZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_SBZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
		case ZONE_SKBZ:
			dat_layout = scr_layout_GHZ;
			dat_aniart = scr_aniart_GHZ;
		break;
	}

	chunks_count = 0;
	var t = 0, tx = 0, ty = 0;

	// For every 128x128 Chunk, we need to set collision tiles based on the chunk present
	// This needs to be done twice, once for each collision plane
	for (var i = 0; i < 2; i++)
		for (var ix = 0; ix < room_width div 128; ix++)
			for (var iy = 0; iy < room_height div 128; iy++) {
				t = tilemap_get(chunks_id,ix,iy);
				if (t) {
					tx = ix*8; ty = iy*8;
					script_execute(dat_layout,i,t,tx,ty); // i=collision plane; t=tile ID; tx=tile_x; ty=tile_y;
					if (i==1) script_execute(dat_aniart,t,ix*128,iy*128);
					chunks_count++;
				}
			}
}
