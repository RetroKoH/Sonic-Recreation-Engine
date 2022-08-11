/// @description Insert description here

// Set up layer IDs
var layer_id = layer_get_id("Collision_0");
map_id[0] = layer_tilemap_get_id(layer_id);
layer_id = layer_get_id("Collision_1");
map_id[1] = layer_tilemap_get_id(layer_id);

enabled = false;	// If false, cannot be seen or utilized
active = false;		// I need to remove these secondary flags.
tileset = 0;		// The tileset being viewed (each one pertains to a different zone)
tile_index = 0;		// The tile being viewed
max_index=256;		// Make dynamic later on

_X1 = 144; _X2 = _X1+127;
_Y1 = 64; _Y2 = _Y1+127;

solidity = false;	// draw solidity
sprites = false;	// draw associated sprites (not available yet)