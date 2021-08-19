function INIT_GAME(){
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
	#macro TILE_SIZE 16

	globalvar map_id, chunks_id, chunks_count;
	map_id = -1; chunks_id = -1; chunks_count = 0;

	scr_collision_arrays();

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

	// Animation Loading Cues
	scr_loadanimations();

	global.core_input = instance_create_layer(0,0,"Core",obj_input);
	global.core_fade = instance_create_layer(0,0,"Core",obj_fade);

	// Global Gameplay object handles
	globalvar player;	player = -1;	// Global handle for player object
	globalvar cam;		cam = -1;		// Global handle for the camera
	globalvar debug;	debug = false;	// by default, disable debug

	global.start_game = true; // Call at the very end
}