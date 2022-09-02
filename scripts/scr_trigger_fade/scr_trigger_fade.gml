function scr_trigger_fade(rm, load_card=false){
	// Used to activate a fade, when player character triggers a fade out.

	fading=true;							// Fading is now active.
	global.core_fade.goto=rm;				// Set destination room. -1 means we stay in the same room.
	global.core_fade.load_card=load_card;	// Set to load title card, or not.
}