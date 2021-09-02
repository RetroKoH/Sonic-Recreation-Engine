/// @description Toggle Debug Mode
debug^=true;

if layer_tilemap_exists(layer_get_id("Collision"),map_id)
{
	if debug	layer_set_visible(layer_get_id("Collision"), true);
	else		layer_set_visible(layer_get_id("Collision"), false);
}