/// @description Init Sonic
xsp=0;			// X-axis speed
ysp=0;			// Y-axis speed
gsp=0;			// Ground speed
height=0;		// Tile collision height
width=0;		// Tile collision width
depth=2;
status=0;		// Status bitfield
				// 0-Facing (1-right), 1-Air (1-true), 2-Spin (1-true), 3-Obj aka if not on tile, but shouldn't fall. (1-true),
				// 4-RollJump (1-true), 5-Push (1-true), 6-Water (1-true) 7-Unknown
routine = 0;	// Routine counter number
angle = 0;		// The angle at which you are moving. (0-360*)
new_angle = 0;	// Used for smoothing down the angle change on slopes.
jump = 0;
invuln_timer = 0;
invinc_timer = 0;
shoes_timer = 0;
super_flag = false;
shield = 0;
platform_ID = -1;
move_lock = false;

topspeed	= 6;          // Maximum X speed via acceleration.
accel_run	= 0.046875;   // X-Acceleration rate.
decel_run	= 0.5;        // X-Deceleraction rate.

// Collision sensors (For debug purposes)
// Left Floor
col_sensor_A    =   false;
col_tile_A      =   -1;
// Right Floor
col_sensor_B    =   false;
col_tile_B      =   -1;
// Left Ceiling
col_sensor_C    =   false;
col_tile_C      =   -1;
// Right Ceiling
col_sensor_D    =   false;
col_tile_D      =   -1;
// Left Wall
col_sensor_E    =   false;
col_tile_E      =   -1;
// Right Wall
col_sensor_F    =   false;
col_tile_f      =   -1;

// Animation system related variables
scr_initanimations(AnimationsSonic,0);