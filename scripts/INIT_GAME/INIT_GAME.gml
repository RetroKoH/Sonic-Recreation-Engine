function INIT_GAME(){

	MACROS();

	global.start_game = false;
	
	// Keymapping
	globalvar keymap_up;		keymap_up=ord("W");
	globalvar keymap_down;		keymap_down=ord("S");
	globalvar keymap_left;		keymap_left=ord("A");
	globalvar keymap_right;		keymap_right=ord("D");
	globalvar keymap_a;			keymap_a=ord("J");
	globalvar keymap_b;			keymap_b=ord("K");
	globalvar keymap_c;			keymap_c=ord("L");
	globalvar keymap_start;		keymap_start=vk_enter;

	globalvar v_limitleft1;		v_limitleft1=0;         // Left level boundary.
	globalvar v_limitright1;    v_limitright1=0;		// Right level boundary.
	globalvar v_limittop1;      v_limittop1=0;          // Top level boundary.
	globalvar v_limitbtm1;      v_limitbtm1=0;			// Bottom level boundary.
	globalvar v_limitleft2;     v_limitleft2=0;         // Left level boundary.
	globalvar v_limitright2;    v_limitright2=0;		// Right level boundary.
	globalvar v_limittop2;      v_limittop2=0;          // Top level boundary.
	globalvar v_limitbtm2;      v_limitbtm2=0;			// Bottom level boundary.
	globalvar v_limitleft3;     v_limitleft3=0;         // Left Level boundary at the end of an act.
	globalvar v_scrshiftx;      v_scrshiftx=0;          // Screen shift as Sonic moves horizontally.
	globalvar v_lookshift;      v_lookshift=0;          // Screen shift when Sonic looks up/down.
	
	// Collision tile related data
	globalvar map_id, chunks_id, chunks_count;
	map_id = -1; chunks_id = -1; chunks_count = 0;
	scr_collision_arrays();

	// Animation Loading Cues
	scr_loadanimations();
	
	// Establish Global oscillating values
	scr_osc_num_init();

	// Set up animal data (sprites and movement)
	scr_init_animals();
	dat_signpost_sparkles();

	global.core_input = instance_create_layer(0,0,"Core",obj_input);
	global.core_fade = instance_create_layer(0,0,"Core",obj_fade);

	// Global Gameplay object handles
	globalvar player;	player = -1;	// Global handle for player object
	globalvar cam;		cam = -1;		// Global handle for the camera
	globalvar debug;	debug = false;	// by default, disable debug
	globalvar zone;		zone = 0;
	globalvar act;		act = 0;

	globalvar f_pause;          f_pause=false;      // Game Pausing flag

	globalvar HUDFONT;          HUDFONT = font_add_sprite(spr_HUDnumbers,ord("0"),false,0); // Numerical HUD Font.
	globalvar p_score;          p_score=0;          // Player's score
	globalvar p_time;           p_time=0;           // Playing time
	globalvar p_timecenti;      p_timecenti=0;      // Playing time
	globalvar p_timeseconds;    p_timeseconds=0;    // Playing time
	globalvar p_timeminutes;    p_timeminutes=0;    // Playing time
	globalvar f_timecount;      f_timecount=false;  // Time counter update flag
	globalvar p_rings;          p_rings=0;          // Player's rings
	globalvar p_lives;          p_lives=3;          // Player's lives
	globalvar p_scorelife;      p_scorelife=50000;  // Amount of points needed for an extra life
	globalvar p_ringlife;       p_ringlife=0;       // Counter for extra lives per rings

	globalvar itembonus;        itembonus=0;        // The counter that determines the number of points received when destroying enemies or objects.
	globalvar timebonus;        timebonus=0;        // The points counter for time bonuses. The faster you complete a level, the higher the bonus. TIME OVER results in NO bonus.
	globalvar ringbonus;        ringbonus=0;        // The points counter for ring bonuses. You get 100 pts per ring when you complete a level.
	globalvar gravity_angle;    gravity_angle=0;    // The global zone gravity. Character gravity is based on this.

	global.start_game = true; // Call at the very end
}

function MACROS() {
	#macro TILE_SIZE 16

	// ZONE Macros
	#macro ZONE_GHZ 0
	#macro ZONE_MZ 1
	#macro ZONE_SYZ 2
	#macro ZONE_LZ 3
	#macro ZONE_SLZ 4
	#macro ZONE_SBZ 5

	// Used by animation engine
	#macro ANIM_NAME 0
	#macro ANIM_SPRITE 1
	#macro ANIM_SPRITEMASK 2
	#macro ANIM_SPRITEMASK_L 3
	#macro ANIM_SUBANIM 4
	#macro ANIM_LOOPBACKTIMES 5
	#macro ANIM_LOOPBACKFRAME 6
	#macro ANIM_LOOPBACKANIM 7
	#macro ANIM_FRAMELIST 8
	#macro ANIM_FRAMESPEEDLIST 9

	// Player Status Macros
	#macro STA_FACING 1
	#macro STA_INAIR 2
	#macro STA_SPIN 4
	#macro STA_ONOBJ 8
	#macro STA_ROLLJUMP $10
	#macro STA_PUSH $20
	#macro STA_WATER $40
}