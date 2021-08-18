function scr_collision_arrays(){
	// These data structures contain the heightmap and angle data for the tiles.
	// (BASED ON ACTUAL COLLISION DATA FROM SONIC 1. EDIT WITH CARE!)

	globalvar col_normal, col_rotated, col_angles;
	col_normal=ds_grid_create(sprite_get_width(SOLIDS) div TILE_SIZE,TILE_SIZE);
	col_rotated=ds_grid_create(sprite_get_width(SOLIDS) div TILE_SIZE,TILE_SIZE);
	col_angles=ds_grid_create(sprite_get_width(SOLIDS) div TILE_SIZE,1);

	// Normal Height Maps (Floor/Ceiling Modes)
	var file=file_bin_open("col_normal.bin",0);
	for(var ix=0;ix<ds_grid_width(col_normal);ix+=1)
	    for(var iy=0;iy<TILE_SIZE;iy+=1)
	        ds_grid_set(col_normal,ix,iy,scr_file_bin_read_ext(file,1,0,true));
	file_bin_close(file);

	// Rotated Height Maps (Wall Modes)
	file=file_bin_open("col_rotated.bin",0);
	for(ix=0;ix<ds_grid_width(col_rotated);ix+=1)
	    for(iy=0;iy<TILE_SIZE;iy+=1)
	        ds_grid_set(col_rotated,ix,iy,scr_file_bin_read_ext(file,1,0,true));
	file_bin_close(file);

	// Angles
	file=file_bin_open("angles.bin",0);
	for(ix=0;ix<ds_grid_width(col_angles);ix+=1)
	{
	    var byte=file_bin_read_byte(file); if byte=$FF byte+=1;
	    ds_grid_set(col_angles,ix,0,(256-byte)*1.40625);
	}
	file_bin_close(file);
}