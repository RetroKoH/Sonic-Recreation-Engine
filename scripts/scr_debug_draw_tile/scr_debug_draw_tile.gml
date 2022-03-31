function scr_debug_draw_tile(ind){
	surface_set_target(surface_tile);
	draw_clear_alpha(c_black, 0);

	var c = draw_get_color();
	draw_set_color(c_gray);
	for (var i = 0; i < TILE_SIZE; i++)
	{
		var l = ds_grid_get(col_normal,ind,i);
		if (l >= $100-TILE_SIZE)  l -= $100;
		
		switch(sign(l))
		{
			case 1:		draw_line(i,TILE_SIZE-1,i,TILE_SIZE-1-l); break;
			case -1:	draw_line(i,-1,i,-l-1); break; // Seems to be some wonkiness w/ this one if I don't use -1
		}
	}

	draw_set_color(c);
	surface_reset_target();
}