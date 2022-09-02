function INIT_LEVEL(this_zone, this_act, bgm, btm, p_x, p_y){
	// Set up layer IDs
	var layer_id = layer_get_id("Collision_0");
	map_id[0] = layer_tilemap_get_id(layer_id);
	layer_id = layer_get_id("Collision_1");
	map_id[1] = layer_tilemap_get_id(layer_id);
	layer_id = layer_get_id("Foreground");
	chunks_id = layer_tilemap_get_id(layer_id);

	// Set Zone and Act
	zone = this_zone; act = this_act;

	// Set up water

	// Set up BGM
	global.default_track = bgm;
	scr_set_bgm(global.default_track);

	// LevelSizeLoad
	// Soft values (Where the camera boundaries appear
	v_limitleft1=0;				// Left level boundary.
	v_limitright1=room_width;	// Right level boundary.
	v_limittop1=0;				// Top level boundary.
	v_limitbtm1=btm;			// Bottom level boundary.

	// Hard values (Where the camera boundaries are set to move to
	v_limitleft2=0;				// Left level boundary.
	v_limitright2=room_width;	// Right level boundary.
	v_limittop2=0;				// Top level boundary.
	v_limitbtm2=btm;			// Bottom level boundary.

	v_limitleft3=0;				// Left Level boundary at the end of an act.
	v_scrshiftx=0;				// Screen shift as player moves horizontally.
	v_lookshift=0;				// Screen shift when player looks up/down.

	// Setup layout Level
	scr_layout_init(zone);

	// Set up Camera and place player
	playermode = PL_SONIC;
	cam = instance_create_layer(p_x-12,p_y+32,"Core",obj_camera);
	player = instance_create_layer(p_x,p_y,"Instances",obj_Players[playermode]);
	instance_create_layer(0,0,"Core",obj21_HUD);
	cam.follow = player;

	// Spawn water surface object if there is water

	// Lamppost data
	if (lamp_last>0) scr_lamp_data_load();
	else
	{
		p_rings = 0;
		p_time = 0;
		framecount=0;
		scr_osc_num_reset();	// Initialize Oscillating numbers
		f_timecount = true;
		osc_active = true;
	}
}