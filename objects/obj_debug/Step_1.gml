/// @description Toggle collision planes
if layer_tilemap_exists(layer_get_id("Collision_0"),map_id[0])
{
	if debug
	{
		if player.col_path==0
		{
			layer_set_visible(layer_get_id("Collision_0"), true);
			layer_set_visible(layer_get_id("Collision_1"), false);
		}
		else
		{
			layer_set_visible(layer_get_id("Collision_0"), false);
			layer_set_visible(layer_get_id("Collision_1"), true);
		}
	}
	else
	{
		layer_set_visible(layer_get_id("Collision_0"), false);
		layer_set_visible(layer_get_id("Collision_1"), false);
	}
}




