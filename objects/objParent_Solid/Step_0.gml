/// @description Collision with Sonic
var _h = floor(bbox_bottom-bbox_top) div 2;
collide = scr_solid_obj(floor(bbox_right-bbox_left) div 2, _h, _h, prev_x);
prev_x = x; // Stored for movement with object (Even for those that don't move)