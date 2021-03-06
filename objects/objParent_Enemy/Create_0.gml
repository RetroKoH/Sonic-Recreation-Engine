/// @description Global Enemy Init

// Respawn information (Only respawn if not destroyed)
active			= true;
can_respawn		= true;
is_respawning	= false;

// Global enemy variables
xsp			= 0;		// X-movement speed
ysp			= 0;		// Y-movement speed
routine		= 0;		// Action routine counter.
can_hit		= true;		// Denotes that enemy can be hit
will_harm	= false;	// Denotes that enemy has harmbox instead of hitbox

// Variables applied w/ mini Sonic
hp			= 1;		// HP (Only really applies w/ mini Sonic)
flash		= 0;		// Flashing invulnerability frames. (Only really applies w/ mini Sonic)