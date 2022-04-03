function INIT_GAME(){
	MACROS();
	global.start_game = false;
	INIT_DEBUG();
	INIT_KEYMAP();
	INIT_SCREEN();
	INIT_COLLIDE();
	INIT_ANIM_DATA();			// Build Animation Data Structures
	INIT_OSC_VALUES();			// Establish Global Oscillating Values
	INIT_OBJDATA_ANIMALS();		// Set up animal data (sprites and movement)
	INIT_OBJDATA_SIGNPOST();	// Set up data for locations of ring sparkles.
	INIT_SOUND_SYSTEM();		// Set up BGM index and sound objects
	INIT_MISC_VARS();
	global.start_game = true; // Call at the very end
}

function MACROS(){
	#macro TILE_SIZE 16
	#macro LOG_TIME 180

	// Keymap array indices
	#macro KEY_DEBUG	0
	#macro KEY_UP		1
	#macro KEY_DOWN		2
	#macro KEY_LEFT		3
	#macro KEY_RIGHT	4
	#macro KEY_A		5
	#macro KEY_B		6
	#macro KEY_C		7
	#macro KEY_START	8

	// ZONE Macros
	#macro ZONE_GHZ	0
	#macro ZONE_MZ	1
	#macro ZONE_SYZ	2
	#macro ZONE_LZ	3
	#macro ZONE_SLZ	4
	#macro ZONE_SBZ	5

	// BGM Index
	enum BGM_tracks {
		GHZ1,
		GHZ2,
		GHZ3,
		MZ1,
		MZ2,
		MZ3,
		SYZ1,
		SYZ2,
		SYZ3,
		LZ1,
		LZ2,
		LZ3,
		SLZ1,
		SLZ2,
		SLZ3,
		SBZ1,
		SBZ2,
		SBZ3,
		FZ,
		total // Used for final count below
	}

	// Player Status Macros
	#macro STA_FACING 1
	#macro STA_INAIR 2
	#macro STA_SPIN 4
	#macro STA_ONOBJ 8
	#macro STA_ROLLJUMP $10
	#macro STA_PUSH $20
	#macro STA_WATER $40
}
function INIT_DEBUG(){
	globalvar debug; debug = true;				// By default, disable debug
	globalvar debuglog; debuglog = "";			// Certain messages will go here
	globalvar debuglog_time; debuglog_time = 0;	// Timer to remove the oldest message

	global.core_debugger = instance_create_layer(0,0,"Core",obj_debugger);
}
function INIT_KEYMAP(){
	INIT_KEY_INDEX();

	// If the controls file doesn't exist, it'll be created automatically here
	if !file_exists("settings.ini") scr_debug_log_add("Settings File Not Found. A new one will be created.");
	ini_open("settings.ini");
	scr_debug_log_add("Controls Loaded from: " + "settings.ini");

	// Initialize defaults if need be.
	if !ini_section_exists("Controls")
	{
		ini_write_real("Controls", "KEY_UP",	vk_up);
		ini_write_real("Controls", "KEY_DOWN",	vk_down); 
		ini_write_real("Controls", "KEY_LEFT",	vk_left); 
		ini_write_real("Controls", "KEY_RIGHT",	vk_right); 
		ini_write_real("Controls", "KEY_A",		ord("A"));
		ini_write_real("Controls", "KEY_B",		ord("S"));
		ini_write_real("Controls", "KEY_C",		ord("D"));
		ini_write_real("Controls", "KEY_START",	vk_enter);
		ini_write_real("Controls", "KEY_DEBUG",	vk_shift);
		scr_debug_log_add("Default Controls Initialized");
	}

	// Keymapping (Defaults will be set if file is present but values are missing
	globalvar keymap_array;
	keymap_array[KEY_UP]=ini_read_real("Controls", "KEY_UP", vk_up);
	keymap_array[KEY_DOWN]=ini_read_real("Controls", "KEY_DOWN", vk_down);
	keymap_array[KEY_LEFT]=ini_read_real("Controls", "KEY_LEFT", vk_left);
	keymap_array[KEY_RIGHT]=ini_read_real("Controls", "KEY_RIGHT", vk_right);
	keymap_array[KEY_A]=ini_read_real("Controls", "KEY_A", ord("A"));
	keymap_array[KEY_B]=ini_read_real("Controls", "KEY_B", ord("S"));
	keymap_array[KEY_C]=ini_read_real("Controls", "KEY_C", ord("D"));
	keymap_array[KEY_START]=ini_read_real("Controls", "KEY_START", vk_enter);
	keymap_array[KEY_DEBUG]=ini_read_real("Controls", "KEY_DEBUG", vk_shift);
	scr_debug_log_add("Keymapping Complete");
	ini_close();
	
	// Create input object
	global.core_input = instance_create_layer(0,0,"Core",obj_input);
}
function INIT_KEY_INDEX(){
	for(var i = 0; i < 256; i++)
	    global._fhinputKeys[i] = "N/A";

	global._fhinputKeys[vk_escape] = "Escape";
	/*global._fhinputKeys[vk_f1] = "F1";
	global._fhinputKeys[vk_f2] = "F2";
	global._fhinputKeys[vk_f3] = "F3";
	global._fhinputKeys[vk_f4] = "F4";
	global._fhinputKeys[vk_f5] = "F5";
	global._fhinputKeys[vk_f6] = "F6";
	global._fhinputKeys[vk_f7] = "F7";
	global._fhinputKeys[vk_f8] = "F8";
	global._fhinputKeys[vk_f9] = "F9";
	global._fhinputKeys[vk_f10] = "F10";
	global._fhinputKeys[vk_f11] = "F11";
	global._fhinputKeys[vk_f12] = "F12";*/
	global._fhinputKeys[vk_pause] = "Pause";
	global._fhinputKeys[192] = "Tilde (~)";
	global._fhinputKeys[48] = "0";
	global._fhinputKeys[49] = "1";
	global._fhinputKeys[50] = "2";
	global._fhinputKeys[51] = "3";
	global._fhinputKeys[52] = "4";
	global._fhinputKeys[53] = "5";
	global._fhinputKeys[54] = "6";
	global._fhinputKeys[55] = "7";
	global._fhinputKeys[56] = "8";
	global._fhinputKeys[57] = "9";
	global._fhinputKeys[189] = "Dash(-)";
	global._fhinputKeys[187] = "Equals(=)";
	global._fhinputKeys[vk_backspace] = "Backspace";
	global._fhinputKeys[65] = "A";
	global._fhinputKeys[66] = "B";
	global._fhinputKeys[67] = "C";
	global._fhinputKeys[68] = "D";
	global._fhinputKeys[69] = "E";
	global._fhinputKeys[70] = "F";
	global._fhinputKeys[71] = "G";
	global._fhinputKeys[72] = "H";
	global._fhinputKeys[73] = "I";
	global._fhinputKeys[74] = "J";
	global._fhinputKeys[75] = "K";
	global._fhinputKeys[76] = "L";
	global._fhinputKeys[77] = "M";
	global._fhinputKeys[78] = "N";
	global._fhinputKeys[79] = "O";
	global._fhinputKeys[80] = "P";
	global._fhinputKeys[81] = "Q";
	global._fhinputKeys[82] = "R";
	global._fhinputKeys[83] = "S";
	global._fhinputKeys[84] = "T";
	global._fhinputKeys[85] = "U";
	global._fhinputKeys[86] = "V";
	global._fhinputKeys[87] = "W";
	global._fhinputKeys[88] = "X";
	global._fhinputKeys[89] = "Y";
	global._fhinputKeys[90] = "Z";
	global._fhinputKeys[219] = "L Bracket([)";
	global._fhinputKeys[221] = "R Bracket(])";
	global._fhinputKeys[220] = "Backslash(\\)";
	global._fhinputKeys[186] = "Semi-Colon(;)";
	global._fhinputKeys[222] = "Apostrophe(')";
	global._fhinputKeys[13] = "Enter";
	global._fhinputKeys[160] = "L Shift";
	global._fhinputKeys[161] = "R Shift";
	global._fhinputKeys[162] = "L Control";
	global._fhinputKeys[163] = "R Control";
	global._fhinputKeys[164] = "L Alt";
	global._fhinputKeys[165] = "R Alt";
	global._fhinputKeys[188] = "Comma(,)";
	global._fhinputKeys[190] = "Period(.)";
	global._fhinputKeys[191] = "Slash(/)";
	global._fhinputKeys[vk_space] = "Spacebar";
	global._fhinputKeys[93] = "Apps";
	global._fhinputKeys[vk_insert] = "Insert";
	global._fhinputKeys[vk_home] = "Home";
	global._fhinputKeys[vk_pageup] = "Page Up";
	global._fhinputKeys[vk_delete] = "Delete";
	global._fhinputKeys[vk_end] = "End";
	global._fhinputKeys[vk_pagedown] = "Page Down";
	global._fhinputKeys[144] = "Numlock";
	global._fhinputKeys[111] = "Numpad Slash(/)";
	global._fhinputKeys[106] = "Numpad Asterisk(*)";
	global._fhinputKeys[109] = "Numpad Dash(-)";
	global._fhinputKeys[vk_numpad0] = "Numpad 0";
	global._fhinputKeys[vk_numpad1] = "Numpad 1";
	global._fhinputKeys[vk_numpad2] = "Numpad 2";
	global._fhinputKeys[vk_numpad3] = "Numpad 3";
	global._fhinputKeys[vk_numpad4] = "Numpad 4";
	global._fhinputKeys[vk_numpad5] = "Numpad 5";
	global._fhinputKeys[vk_numpad6] = "Numpad 6";
	global._fhinputKeys[vk_numpad7] = "Numpad 7";
	global._fhinputKeys[vk_numpad8] = "Numpad 8";
	global._fhinputKeys[vk_numpad9] = "Numpad 9";
	global._fhinputKeys[110] = "Numpad Period(.)";
	global._fhinputKeys[107] = "Numpad Plus(+)";
	global._fhinputKeys[vk_left] = "Left Arrow";
	global._fhinputKeys[vk_right] = "Right Arrow";
	global._fhinputKeys[vk_up] = "Up Arrow";
	global._fhinputKeys[vk_down] = "Down Arrow";
}
function INIT_SCREEN(){
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

	global.core_fade = instance_create_layer(0, 1, "Core", obj_fade);
}
function INIT_COLLIDE(){
	// Collision tile related data
	globalvar map_id, chunks_id, chunks_count;
	map_id[0] = -1; map_id[1] = -1; chunks_id = -1; chunks_count = 0;
	INIT_COL_ARRAYS();
}
function INIT_COL_ARRAYS(){
	// These data structures contain the heightmap and angle data for the tiles.
	// (BASED ON ACTUAL COLLISION DATA FROM SONIC 1. EDIT WITH CARE!)

	globalvar col_normal, col_rotated, col_angles;
	col_normal=ds_grid_create(sprite_get_width(SOLIDS) div TILE_SIZE,TILE_SIZE);
	col_rotated=ds_grid_create(sprite_get_width(SOLIDS) div TILE_SIZE,TILE_SIZE);
	col_angles=ds_grid_create(sprite_get_width(SOLIDS) div TILE_SIZE,1);

	// Normal Height Maps (Floor/Ceiling Modes)
	var file=file_bin_open("col_normal.bin",0);
	for(var ix=0;ix<ds_grid_width(col_normal);ix+=1)
	    for(var iy=0;iy<TILE_SIZE;iy+=1)
	        ds_grid_set(col_normal,ix,iy,scr_file_bin_read_ext(file,1,0,true));
	file_bin_close(file);

	// Rotated Height Maps (Wall Modes)
	file=file_bin_open("col_rotated.bin",0);
	for(ix=0;ix<ds_grid_width(col_rotated);ix+=1)
	    for(iy=0;iy<TILE_SIZE;iy+=1)
	        ds_grid_set(col_rotated,ix,iy,scr_file_bin_read_ext(file,1,0,true));
	file_bin_close(file);

	// Angles
	file=file_bin_open("angles.bin",0);
	for(ix=0;ix<ds_grid_width(col_angles);ix+=1)
	{
	    var byte=file_bin_read_byte(file); if byte=$FF byte+=1;
	    ds_grid_set(col_angles,ix,0,(256-byte)*1.40625);
	}
	file_bin_close(file);
}
function INIT_ANIM_DATA(){
	globalvar animation_index; animation_index = array_create(0);	// Every script below pushes an animation into this index
	animtable_BUZZBOMBER();
	animtable_CRABMEAT();
	animtable_MONITORS();
	animtable_MOTOBUG();
	animtable_RINGS();
	animtable_SIGNPOST();
	animtable_SONIC();
	animtable_SPRINGS();
	animtable_TITLESONIC();
}
function INIT_OSC_VALUES(){
	globalvar osc_active; osc_active = false;
	// Oscillitary Variables - These dictate movement of some objects/graphics. NOT all are running in all levels. You can change this in "scrOscNumDo".
	// +2 - MZ & LZ
	globalvar osc_0a;	osc_0a=.5;		// Actual value. Starts at this baseline.
	globalvar osc_0b;	osc_0b=0;		// Value that "a" is increased/decreased by.
	globalvar inc_0;	inc_0=.0078125;	// Amount that "b" increments by.
	globalvar lim_0;	lim_0=.4921875;	// polarity is reversed when "b" reaches this value.
	globalvar pol_0;	pol_0=1;		// polarity of var "b".
	// +6 - MZ & SBZ
	globalvar osc_1a;	osc_1a=.5;		// Actual value. Starts at this baseline.
	globalvar osc_1b;	osc_1b=0;		// Value that "a" is increased/decreased by.
	globalvar inc_1;	inc_1=.0078125;	// Amount that "b" increments by.
	globalvar lim_1;	lim_1=.609375;	// polarity is reversed when "b" reaches this value.
	globalvar pol_1;	pol_1=1;		// polarity of var "b".
	// +$A - MZ, SYZ, LZ, SLZ
	globalvar osc_2a;	osc_2a=.5;		// Actual value. Starts at this baseline.
	globalvar osc_2b;	osc_2b=0;		// Value that "a" is increased/decreased by.
	globalvar inc_2;	inc_2=.0078125;	// Amount that "b" increments by.
	globalvar lim_2;	lim_2=.703125;	// polarity is reversed when "b" reaches this value.
	globalvar pol_2;	pol_2=1;		// polarity of var "b".
	// +$E - GHZ, MZ, SYZ, LZ, SLZ, SBZ
	globalvar osc_3a;	osc_3a=.5;		// Actual value. Starts at this baseline.
	globalvar osc_3b;	osc_3b=0;		// Value that "a" is increased/decreased by.
	globalvar inc_3;	inc_3=.0078125;	// Amount that "b" increments by.
	globalvar lim_3;	lim_3=.859375;	// polarity is reversed when "b" reaches this value.
	globalvar pol_3;	pol_3=1;		// polarity of var "b".
	// +$12 - MZ
	globalvar osc_4a;	osc_4a=.5;		// Actual value. Starts at this baseline.
	globalvar osc_4b;	osc_4b=0;		// Value that "a" is increased/decreased by.
	globalvar inc_4;	inc_4=.015625;	// Amount that "b" increments by.
	globalvar lim_4;	lim_4=.984375;	// polarity is reversed when "b" reaches this value.
	globalvar pol_4;	pol_4=1;		// polarity of var "b".
	// +$16 - MZ
	globalvar osc_5a;	osc_5a=.5;		// Actual value. Starts at this baseline.
	globalvar osc_5b;	osc_5b=0;		// Value that "a" is increased/decreased by.
	globalvar inc_5;	inc_5=.03125;	// Amount that "b" increments by.
	globalvar lim_5;	lim_5=.6875;	// polarity is reversed when "b" reaches this value.
	globalvar pol_5;	pol_5=1;		// polarity of var "b".
	// +$1A - GHZ, MZ, SYZ, SLZ, SBZ
	globalvar osc_6a;	osc_6a=.5;			// Actual value. Starts at this baseline.
	globalvar osc_6b;	osc_6b=0;			// Value that "a" is increased/decreased by.
	globalvar inc_6;	inc_6=.03125;		// Amount that "b" increments by.
	globalvar lim_6;	lim_6=2;			// polarity is reversed when "b" reaches this value.
	globalvar pol_6;	pol_6=1;			// polarity of var "b".
	// +$1E - MZ, SYZ, LZ, SLZ, SBZ
	globalvar osc_7a;	osc_7a=.5;			// Actual value. Starts at this baseline.
	globalvar osc_7b;	osc_7b=0;			// Value that "a" is increased/decreased by.
	globalvar inc_7;	inc_7=.015625;		// Amount that "b" increments by.
	globalvar lim_7;	lim_7=1.40625;		// polarity is reversed when "b" reaches this value.
	globalvar pol_7;	pol_7=1;			// polarity of var "b".
	// +$22 - SLZ
	globalvar osc_8a;	osc_8a=.5;			// Actual value. Starts at this baseline.
	globalvar osc_8b;	osc_8b=0;			// Value that "a" is increased/decreased by.
	globalvar inc_8;	inc_8=0.0078125;	// Amount that "b" increments by.
	globalvar lim_8;	lim_8=1.1171875;	// polarity is reversed when "b" reaches this value.
	globalvar pol_8;	pol_8=1;			// polarity of var "b".
	// +$26 - SLZ
	globalvar osc_9a;	osc_9a=50.9375;		// Actual value. Starts at this baseline.
	globalvar osc_9b;	osc_9b=1.1171875;	// Value that "a" is increased/decreased by.
	globalvar inc_9;	inc_9=0.0078125;	// Amount that "b" increments by.
	globalvar lim_9;	lim_9=1.1171875;	// polarity is reversed when "b" reaches this value.
	globalvar pol_9;	pol_9=1;			// polarity of var "b".
	// +$2A - MZ, SYZ, LZ, SLZ
	globalvar osc_Aa;	osc_Aa=20.5;		// Actual value. Starts at this baseline.
	globalvar osc_Ab;	osc_Ab=0.703125;	// Value that "a" is increased/decreased by.
	globalvar inc_A;	inc_A=0.0078125;	// Amount that "b" increments by.
	globalvar lim_A;	lim_A=0.703125;		// polarity is reversed when "b" reaches this value.
	globalvar pol_A;	pol_A=1;			// polarity of var "b".
	// +$2E - MZ, SYZ, LZ, SLZ
	globalvar osc_Ba;	osc_Ba=30.5;		// Actual value. Starts at this baseline.
	globalvar osc_Bb;	osc_Bb=1.0546875;	// Value that "a" is increased/decreased by.
	globalvar inc_B;	inc_B=0.01171875;	// Amount that "b" increments by.
	globalvar lim_B;	lim_B=1.0546875;	// polarity is reversed when "b" reaches this value.
	globalvar pol_B;	pol_B=1;			// polarity of var "b".
	// +$32 - MZ, SYZ, LZ, SLZ
	globalvar osc_Ca;	osc_Ca=50.5;		// Actual value. Starts at this baseline.
	globalvar osc_Cb;	osc_Cb=1.7578125;	// Value that "a" is increased/decreased by.
	globalvar inc_C;	inc_C=.01953125;	// Amount that "b" increments by.
	globalvar lim_C;	lim_C=1.7578125;	// polarity is reversed when "b" reaches this value.
	globalvar pol_C;	pol_C=1;			// polarity of var "b".
	// +$36 - MZ, SYZ, LZ, SLZ
	globalvar osc_Da;	osc_Da=70.5;		// Actual value. Starts at this baseline.
	globalvar osc_Db;	osc_Db=2.4609375;	// Value that "a" is increased/decreased by.
	globalvar inc_D;	inc_D=.02734375;	// Amount that "b" increments by.
	globalvar lim_D;	lim_D=2.4609375;	// polarity is reversed when "b" reaches this value.
	globalvar pol_D;	pol_D=1;			// polarity of var "b".
	// +$3A - UNUSED
	globalvar osc_Ea;	osc_Ea=.5;			// Actual value. Starts at this baseline.
	globalvar osc_Eb;	osc_Eb=0;			// Value that "a" is increased/decreased by.
	globalvar inc_E;	inc_E=.0078125;		// Amount that "b" increments by.
	globalvar lim_E;	lim_E=.4921875;		// polarity is reversed when "b" reaches this value.
	globalvar pol_E;	pol_E=1;			// polarity of var "b".
	// +$3E - UNUSED
	globalvar osc_Fa;	osc_Fa=.5;			// Actual value. Starts at this baseline.
	globalvar osc_Fb;	osc_Fb=0;			// Value that "a" is increased/decreased by.
	globalvar inc_F;	inc_F=.0078125;		// Amount that "b" increments by.
	globalvar lim_F;	lim_F=.4921875;		// polarity is reversed when "b" reaches this value.
	globalvar pol_F;	pol_F=1;			// polarity of var "b".
}
function INIT_OBJDATA_ANIMALS(){
	globalvar ani_sprite, ani_xsp, ani_ysp;
	var ani = 0;
	// 0 - Flicky (Bluebird)
	ani_sprite[ani] = spr_animal_flicky;
	ani_xsp[ani] = -3;
	ani_ysp[ani] = -4;
	
	ani++;
	// 1 - Ricky (Squirrel)
	ani_sprite[ani] = spr_animal_ricky;
	ani_xsp[ani] = -2.5;
	ani_ysp[ani] = -3.5;

	ani++;
	// 2 - Pocky (Rabbit)
	ani_sprite[ani] = spr_animal_pocky;
	ani_xsp[ani] = -2;
	ani_ysp[ani] = -4;

	ani++;
	// 3 - Pecky (Penguin)
	ani_sprite[ani] = spr_animal_pecky;
	ani_xsp[ani] = -1.5;
	ani_ysp[ani] = -2.5;
	
	ani++;
	// 4 - Picky (Pig)
	ani_sprite[ani] = spr_animal_picky;
	ani_xsp[ani] = -1.75;
	ani_ysp[ani] = -3;
	
	ani++;
	// 5 - Clucky (Chicken)
	ani_sprite[ani] = spr_animal_clucky;
	ani_xsp[ani] = -2;
	ani_ysp[ani] = -3;
	
	ani++;
	// 6 - Rocky (Seal)
	ani_sprite[ani] = spr_animal_rocky;
	ani_xsp[ani] = -1.25;
	ani_ysp[ani] = -1.5;
}
function INIT_OBJDATA_SIGNPOST(){
	// Data Structure for locations of ring sparkles. Each value is added to signpost's
	// position, and a ring object is created, in its sparkle routine.
	globalvar sparkpos;
	sparkpos[0,0]=-$18; sparkpos[0,1]=-$10;
	sparkpos[1,0]=8;    sparkpos[1,1]=8;
	sparkpos[2,0]=-$10; sparkpos[2,1]=0;
	sparkpos[3,0]=$18;  sparkpos[3,1]=-8;
	sparkpos[4,0]=0;    sparkpos[4,1]=-8;
	sparkpos[5,0]=$10;  sparkpos[5,1]=0;
	sparkpos[6,0]=-$18; sparkpos[6,1]=8;
	sparkpos[7,0]=$18;  sparkpos[7,1]=$10;
}
function INIT_SOUND_SYSTEM(){
	global.core_sound = instance_create_layer(0, 2, "Core", obj_soundcontrol);
	global.core_music = instance_create_layer(0, 3, "Core", obj_musiccontrol);
	global.ring = 1;	// Alternates between 1 and -1;

	// Database of BGM tracks and loop data
	global.BGM_list = array_create(BGM_tracks.total)
	
	global.BGM_list[BGM_tracks.GHZ1] = {
		ID			: M_GHZ1,
		loop_start	: 14.512,
		loop_end	: 52.966
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.GHZ2] = {
		ID			: M_GHZ2,
		loop_start	: 14.414,
		loop_end	: 52.812
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.GHZ3] = {
		ID			: M_GHZ3,
		loop_start	: 14.222,
		loop_end	: 52.630
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.MZ1] = {
		ID			: M_MZ1,
		loop_start	: 2.156,
		loop_end	: 38.256
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.MZ2] = {
		ID			: M_MZ2,
		loop_start	: 1.999,
		loop_end	: 48.782
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.MZ3] = {
		ID			: M_MZ3,
		loop_start	: 1.805,
		loop_end	: 33.575
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SYZ1] = {
		ID			: M_SYZ1,
		loop_start	: 2.480,
		loop_end	: 40.930
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SYZ2] = {
		ID			: M_SYZ2,
		loop_start	: 2.306,
		loop_end	: 40.694
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SYZ3] = {
		ID			: M_SYZ3,
		loop_start	: 19.205,
		loop_end	: 57.610
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.LZ1] = {
		ID			: M_LZ1,
		loop_start	: 1.932,
		loop_end	: 36.536
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.LZ2] = {
		ID			: M_LZ2,
		loop_start	: 1.932,
		loop_end	: 36.482
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.LZ3] = {
		ID			: M_LZ3,
		loop_start	: 0.000,
		loop_end	: 53.772
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SLZ1] = {
		ID			: M_SLZ1,
		loop_start	: 1.520,
		loop_end	: 43.807
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SLZ2] = {
		ID			: M_SLZ2,
		loop_start	: 3.125,
		loop_end	: 45.358
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SLZ3] = {
		ID			: M_SLZ3,
		loop_start	: 43.682,
		loop_end	: 85.918
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SBZ1] = {
		ID			: M_SBZ1,
		loop_start	: 0.173,
		loop_end	: 72.260
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SBZ2] = {
		ID			: M_SBZ2,
		loop_start	: 3.208,
		loop_end	: 60.809
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SBZ3] = {
		ID			: M_SBZ3,
		loop_start	: 4.014,
		loop_end	: 76.012
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.FZ] = {
		ID			: M_FZ,
		loop_start	: 1.977,
		loop_end	: 21.206
	}
}
function INIT_MISC_VARS(){
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
}