function scr_trigger_fade(rm){
	// Used to activate a fade, when player character triggers a fade out.

	fading=true;                // Fading is now active.
	// (This is skipped when fading out of battle)
	//if instance_exists(objPlayer) objPlayer.speed=0; // Lock character in place.
	global.core_fade.goto=rm;   // Set destination room. -1 means we stay in the same room.
}