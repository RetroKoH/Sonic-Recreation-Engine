/// @description Global Enemy Init
event_inherited();
scr_obj_OOB_settings(OOB_RESET);

// Global enemy variables
xsp			= 0;		// X-movement speed
ysp			= 0;		// Y-movement speed
routine		= 0;		// Action routine counter.
can_hit		= true;		// Denotes that enemy can be hit
can_harm	= true;		// Denotes that enemy can harm on contact

// Variables applied w/ mini Sonic
hp			= 1;		// HP (Only really applies w/ mini Sonic)
flash		= 0;		// Flashing invulnerability frames. (Only really applies w/ mini Sonic)