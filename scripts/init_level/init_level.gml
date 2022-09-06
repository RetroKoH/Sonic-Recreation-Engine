function INIT_LEVEL(this_zone, this_act, bgm, limitbtm, limitrgt, p_x, p_y){
	instance_create_layer(0,0,"Core",Core_Level);
	
	// Set up layer IDs
	var layer_id = layer_get_id("Collision_0");
	map_id[0] = layer_tilemap_get_id(layer_id);
	layer_id = layer_get_id("Collision_1");
	map_id[1] = layer_tilemap_get_id(layer_id);
	spr_id = layer_get_id("Anim_Art");
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
	v_limitright1=limitrgt;		// Right level boundary.
	v_limittop1=0;				// Top level boundary.
	v_limitbtm1=limitbtm;		// Bottom level boundary.

	// Hard values (Where the camera boundaries are set to move to
	v_limitleft2=0;				// Left level boundary.
	v_limitright2=limitrgt;		// Right level boundary.
	v_limittop2=0;				// Top level boundary.
	v_limitbtm2=limitbtm;		// Bottom level boundary.

	v_limitleft3=0;				// Left Level boundary at the end of an act.
	v_scrshiftx=0;				// Screen shift as player moves horizontally.
	v_lookshift=0;				// Screen shift when player looks up/down.

	// Setup layout Level
	scr_layout_init(zone);

	// Set up Camera and place player
	cam = instance_create_layer(p_x-12,p_y+32,"Core",Core_Camera);
	player = instance_create_layer(p_x,p_y,"Instances",obj_Players[playermode]);
	instance_create_layer(0,0,"Core",obj21_HUD);
	cam.follow = player;

	// Spawn water surface object if there is water

	// Lamppost data - Returning from lamppost or Giant Ring
	if (lamp_last>0) scr_lamp_data_load();

	else // Starting a level
	{
		p_time = 0;	// Playing time

		if (f_restart) { // Restarting a level from death
			p_rings = 0;
			p_score = start_score;	// For the eventual Score Attack
		}

		else { // Starting new level
			// Reset bonuses (Should only do on new level start)
			p_rings = 0;
			p_score = start_score;	// For the eventual Score Attack
			timebonus=50000;
			ringbonus=0;
			coolbonus=10000;
		}
	}
	scr_osc_num_reset();	// Initialize Oscillating numbers
	// Timers will be set after fade in
}