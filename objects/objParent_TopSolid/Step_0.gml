/// @description Collision with Sonic
var _h = floor(y-bbox_top); // platform's surface Y coordinate
collide = scr_topsolid_obj(floor(bbox_right-bbox_left) div 2, _h, _h, prev_x);
prev_x = x; // Stored for movement with object (Even for those that don't move)