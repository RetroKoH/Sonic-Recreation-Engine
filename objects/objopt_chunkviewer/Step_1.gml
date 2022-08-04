/// @description Check solidity visibility
if !visible{
	layer_set_visible(layer_get_id("Collision_0"), false);
	layer_set_visible(layer_get_id("Collision_1"), false);
}
else {
	layer_set_visible(layer_get_id("Collision_0"), true);
	layer_set_visible(layer_get_id("Collision_1"), true);
}
