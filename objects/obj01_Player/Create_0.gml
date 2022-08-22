/// @description Init Player
xsp=0;			// X-axis speed
ysp=0;			// Y-axis speed
gsp=0;			// Ground speed
defaultHeight=0;// Default tile collision height
height=0;		// Tile collision height
width=0;		// Tile collision width
depth=2;
status=0;		// Status bitfield
				// 0-Facing (1-right), 1-Air (1-true), 2-Spin (1-true), 3-Obj aka if not on tile, but shouldn't fall. (1-true),
				// 4-RollJump (1-true), 5-Push (1-true), 6-Water (1-true) 7-Unknown
powerups=0;		// Powerup Status bitfield
				// 0-Shield (any), 1-Invincibility, 2-Speed Shoes, 3-Unused
				// 4-Reflect (instashield), 5-Flame, 6-Bubble, 7-Lightning
super = false;	// Super Flag
my_shield = -1;	// Reserved Object Space for Shield
my_stars = -1;	// Reserved Object Space for Invinc Stars

routine = 0;	// Routine counter number
ctrl = false;	// Control mode flag

col_path = 0;	// Collision has two paths
angle = 0;		// The angle at which you are moving. (0-360*)
move_angle = 0; // Temporary. Will remove later
	
jump = false;
double_jump = scr_sonic_doublejump;
double_jump_flag = false;
double_jump_property = 0;
dash_flag = false; // Variables used for Spindash, Peelout, and Drop Dash
spindash_flag = false;
dash_timer = 0;
invuln_timer = 0;
invinc_timer = 0;
shoes_timer = 0;
convex = false;
platform_ID = -1;
move_lock = false;

topspeed	= 6;		// Maximum X speed via acceleration.
accel_run	= 0.046875;	// X-Acceleration rate.
decel_run	= 0.5;		// X-Deceleraction rate.
jmp_spd		= 6.5;		// Default jump velocity

// Collision sensors (For debug purposes)
col_tile		=	-1;
col_angle		=	0;
col_other_dist	=	0;
// Left Floor
col_sensor_A    =   false;
col_tile_A      =   -1;
col_angle_A		=	0;
// Right Floor
col_sensor_B    =   false;
col_tile_B      =   -1;
col_angle_B		=	0;
// Left Ceiling
col_sensor_C    =   false;
col_tile_C      =   -1;
col_angle_C		=	0;
// Right Ceiling
col_sensor_D    =   false;
col_tile_D      =   -1;
col_angle_D		=	0;
// Left Wall
col_sensor_E    =   false;
col_tile_E      =   -1;
// Right Wall
col_sensor_F    =   false;
col_tile_F      =   -1;

// Animation system related variables
scr_init_anim(global.AnimationsSonic,0);