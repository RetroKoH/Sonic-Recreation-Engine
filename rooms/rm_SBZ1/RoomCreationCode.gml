// Set up layer IDs
var layer_id = layer_get_id("Collision_0");
map_id[0] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Collision_1");
map_id[1] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Foreground");
chunks_id = layer_tilemap_get_id(layer_id);

// Set Zone and Act
zone = ZONE_SBZ;
act = 0;

// Initialize Oscillating numbers
scr_osc_num_reset();

// Setup layout
LAYOUT_GHZ();

// Set up Camera and place player
cam = instance_create_layer(78,940,"Core",obj_camera);
player = instance_create_layer(90,908,"Instances",obj_Players[playermode]);
instance_create_layer(0,0,"Core",obj21_HUD);

// Soft values (Where the camera boundaries appear
v_limitleft1=0;				// Left level boundary.
v_limitright1=room_width;	// Right level boundary.
v_limittop1=0;				// Top level boundary.
v_limitbtm1=988;			// Bottom level boundary.

// Hard values (Where the camera boundaries are set to move to
v_limitleft2=0;				// Left level boundary.
v_limitright2=room_width;	// Right level boundary.
v_limittop2=0;				// Top level boundary.
v_limitbtm2=988;			// Bottom level boundary.

v_limitleft3=0;         // Left Level boundary at the end of an act.
v_scrshiftx=0;          // Screen shift as player moves horizontally.
v_lookshift=0;          // Screen shift when player looks up/down.

cam.follow = player;
f_timecount = true;
osc_active = true;
scr_set_bgm(BGM_tracks.SBZ1);