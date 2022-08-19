/// @description Collision with Sonic
event_inherited();		// Get solid collision
if collide == spik_dir	// If top collision (Change this based on given direction of subtype)
{
	var obj = self;
	with(player) scr_player_hurt(obj);
}