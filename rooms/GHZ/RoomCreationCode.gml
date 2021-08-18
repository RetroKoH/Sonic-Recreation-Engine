// Collision IDs
layer_id = layer_get_id("Collision");
map_id = layer_tilemap_get_id(layer_id);

// Set up Camera and place player
cam = instance_create_layer(78,340,"Core",obj_camera);
player = instance_create_layer(78,700,"Instances",obj01_Sonic);

v_limitleft1=0;         // Left level boundary.
v_limitright1=room_width; // Right level boundary.
v_limittop1=0;          // Top level boundary.
v_limitbtm1=room_height; // Bottom level boundary.
v_limitleft2=0;         // Left level boundary.
v_limitright2=room_width; // Right level boundary.
v_limittop2=0;          // Top level boundary.
v_limitbtm2=room_height; // Bottom level boundary.
v_limitleft3=0;         // Left Level boundary at the end of an act.
v_scrshiftx=0;          // Screen shift as player moves horizontally.
v_lookshift=0;          // Screen shift when player looks up/down.

cam.follow = player;