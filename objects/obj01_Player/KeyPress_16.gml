/// @description Insert description here
// You can write your code in this editor
x=90;
y=908;

xsp=0;						// X-axis speed
ysp=0;						// Y-axis speed
gsp=0;						// Ground speed
routine = 0;	// Routine counter number
ctrl = false;	// Control mode flag
status=0;		// Status bitfield
				// 0-Facing (1-right), 1-Air (1-true), 2-Spin (1-true), 3-Obj aka if not on tile, but shouldn't fall. (1-true),
				// 4-RollJump (1-true), 5-Push (1-true), 6-Water (1-true) 7-Unknown
powerups=0;		// Powerup Status bitfield
				// 0-Shield (any), 1-Invincibility, 2-Speed Shoes, 3-Unused
				// 4-Reflect (instashield), 5-Flame, 6-Bubble, 7-Lightning

// Reset all Ability-related variables and flags
jump = false;
double_jump_flag = false;
double_jump_property = 0;
dash_flag = false; // Variables used for Spindash, Peelout, and Drop Dash
spindash_flag = false;
spindash_pitch = 1;
dash_timer = 0;
fly_carrying_flag = false;	// Flag noting that this character is carrying a partner
fly_pickup_timer = 0;		// Tails can only pick up a partner when this is 0
glide_direction = 0;		// Intended direction of the glide. (Angle of glide = double_jump_property)
glide_collision_prop = 0;	// Glide collision status
wall_grab_disabled = false;	// If true, wall grabs are disabled
wall_grab_initial_x = 0;	// Set to x whenever Knuckles grabs a wall.

invuln_timer = 0;
invinc_timer = 0;
shoes_timer = 0;
convex = false;
platform_ID = -1;
move_lock = false;

cam.follow = player;