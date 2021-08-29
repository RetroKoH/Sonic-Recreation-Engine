// Set up layer IDs
var layer_id = layer_get_id("Collision");
map_id = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Foreground");
chunks_id = layer_tilemap_get_id(layer_id);

// Set Zone and Act
zone = 0;
act = 0;

// Initialize Oscillating numbers
scr_osc_num_reset();

// Setup layout
LAYOUT_GHZ();

// Set up Camera and place player
cam = instance_create_layer(78,940,"Core",obj_camera);
player = instance_create_layer(80,944,"Instances",obj01_Sonic);

v_limitleft1=0;         // Left level boundary.
v_limitright1=room_width; // Right level boundary.
v_limittop1=0;          // Top level boundary.
v_limitbtm1=988; // Bottom level boundary.
v_limitleft2=0;         // Left level boundary.
v_limitright2=room_width; // Right level boundary.
v_limittop2=0;          // Top level boundary.
v_limitbtm2=room_height; // Bottom level boundary.
v_limitleft3=0;         // Left Level boundary at the end of an act.
v_scrshiftx=0;          // Screen shift as player moves horizontally.
v_lookshift=0;          // Screen shift when player looks up/down.

cam.follow = player;