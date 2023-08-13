function INIT_GAME(){
	MACROS();
	global.start_game = false;
	INIT_DEBUG();
	INIT_KEYMAP();
	INIT_SCREEN();
	INIT_COLLIDE();
	INIT_ANIM_DATA();			// Build Animation Data Structures
	INIT_OSC_VALUES();			// Establish Global Oscillating Values
	INIT_SYNC_ANIM_TIMERS();	// Set Up Sync Animation Timers
	INIT_OBJDATA_LOSTRINGS();	// Set up trajectories for lost rings
	INIT_OBJDATA_ANIMALS();		// Set up animal data (sprites and movement)
	INIT_OBJDATA_SIGNPOST();	// Set up data for locations of ring sparkles.
	INIT_OBJDATA_HEIGHTMAPS();
	INIT_OBJDATA_SMASHFRAGS();	// Set up speeds for smashable object fragments.
	INIT_OBJDATA_TITLECARDS();
	INIT_SOUND_SYSTEM();		// Set up BGM index and sound objects
	INIT_LEVEL_SELECT();		// Set up the Level Select Screen
	INIT_MISC_VARS();
	global.start_game = true; // Call at the very end
}

function MACROS(){
	#macro TILE_SIZE 16
	#macro LOG_TIME 180
	#macro SCR_WIDTH 320
	#macro SCR_HEIGHT 224
	#macro VIEW_HEIGHT 424
	#macro VIEW_WIDTH 240

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

	// PLAYER MODE Macros
	#macro PL_SONIC		0
	#macro PL_TAILS		1
	#macro PL_KNUCKLES	2
	#macro PL_AMY		3
	#macro PL_MIGHTY	4
	#macro PL_RAY		5
	#macro PL_METAL		6

	// ZONE Macros
	#macro ZONE_GHZ		0
	#macro ZONE_BZ		1
	#macro ZONE_MZ		2
	#macro ZONE_JZ		3
	#macro ZONE_SYZ		4
	#macro ZONE_LZ		5
	#macro ZONE_SLZ		6
	#macro ZONE_SBZ		7
	#macro ZONE_SKBZ	8
	#macro ZONE_MGHZ	9

	// BGM Index
	enum BGM_tracks {
		Title,
		LevelSelect,
		GHZ1,
		GHZ2,
		BZ1,
		BZ2,
		MZ1,
		MZ2,
		JZ1,
		JZ2,
		SYZ1,
		SYZ2,
		LZ1,
		LZ2,
		SLZ1,
		SLZ2,
		SBZ1,
		SBZ2,
		SBZ3,
		FZ,
		SKBZ1,
		SKBZ2,
		Boss,
		ActClear,
		Invinc,
		total // Used for final count
	}

	// Lev Select Cursor Index
	enum LevSel_items {
		GHZ1,
		GHZ2,
		BZ1,
		BZ2,
		MZ1,
		MZ2,
		JZ1,
		JZ2,
		SYZ1,
		SYZ2,
		LZ1,
		LZ2,
		SLZ1,
		SLZ2,
		SBZ1,
		SBZ2,
		SBZ3,
		SkBZ1,
		SkBZ2,
		Char,
		total // Used for final count
	}

	// Player Status Macros
	#macro STA_FACING 1
	#macro STA_INAIR 2
	#macro STA_SPIN 4
	#macro STA_ONOBJ 8
	#macro STA_ROLLJUMP $10
	#macro STA_PUSH $20
	#macro STA_WATER $40
	// Powerup Status Macros
	#macro POW_SHIELD 1
	#macro POW_INVINC 2
	#macro POW_SHOES 4
	#macro POW_UNK 8
	#macro POW_REFLECT $10
	#macro POW_FLAME $20
	#macro POW_BUBBLE $40
	#macro POW_LIGHTNING $80
	// Additional flags for quick computation
	#macro POW_RMVSHIELDS $1E
	#macro POW_CHKELSHLDS $E0
	#macro POW_CHKALLSHLD $E3

	// OutOfBounds constants
	#macro OOB_DESTROY 0
	#macro OOB_PAUSE 1
	#macro OOB_RESET 2

	// Monitor constants
	#macro MON_EGGMAN 0
	#macro MON_SPEEDSHOES 1
	#macro MON_SHIELD 2
	#macro MON_INVINC 3
	#macro MON_RINGS 4
	#macro MON_SUPER 5
	#macro MON_GOGGLES 6
	#macro MON_SHIELD_F 7
	#macro MON_SHIELD_B 8
	#macro MON_SHIELD_L 9
	#macro MON_CLOCK 10
	#macro MON_EXTRALIFE 11 // bumped from #1 to the end for easier sprite swapping
	
	// Player Sizes
	#macro HEIGHT_MAIN $13	// Standard height
	#macro HEIGHT_SHORT $F	// Tails' standing height
	#macro HEIGHT_ROLL $E	// Rolling height
	#macro HEIGHT_GLIDE $A	// Gliding height
	#macro WIDTH_MAIN 9		// Standard Width
	#macro WIDTH_ROLL 7		// Rolling Width
	#macro WIDTH_GLIDE $A	// Gliding Width
}
function INIT_DEBUG(){
	globalvar debug; debug = true;						// By default, disable debug
	globalvar debuglog; debuglog = "";					// Certain messages will go here
	globalvar debuglog_time; debuglog_time = 0;			// Timer to remove the oldest message
	instance_create_layer(0,0,"Core",Core_Debugger);
}
function INIT_KEYMAP(){
	INIT_KEY_INDEX();
	globalvar key_ignore; key_ignore=false;

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
	instance_create_layer(0,0,"Core",Core_Input); // Create input object
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
	instance_create_layer(0, 1, "Core", Core_Fade);
	instance_create_layer(0, 1, "Core", Core_Interface);
}
function INIT_COLLIDE(){
	// Collision tile related data
	globalvar map_id, spr_id, chunks_id, chunks_count;
	map_id[0] = -1; map_id[1] = -1; spr_id = -1; chunks_id = -1; chunks_count = 0;
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
	
	// Pre-cooked values
	globalvar angle_data;
	angle_data = [];
	for (var i = 0; i < 256; i++) {
		var _ang = i * 1.40625;
		var _dat = {
			angle	: _ang,
			a_sin	: dsin(_ang),
			a_cos	: dcos(_ang),
			quad	: floor(scr_wrap_angle((_ang + ((_ang >= 180) ? 1.40625 : 0)) + 43.59375) / 90)
		}
		
		array_push(angle_data, _dat);
	}
}
function INIT_ANIM_DATA(){
	globalvar animation_index; animation_index = array_create(0);	// Every script below pushes an animation into this index
	animtable_PLAYERS();
	animtable_SHIELDS();
	animtable_BADNIKS();
	animtable_MONITORS();
	animtable_RINGS();
	animtable_SIGNPOST();
	animtable_LAMPPOST();
	animtable_SPRINGS();
	animtable_TITLESONIC();
	animtable_LVLOBJ_SYZ();
	animtable_LVLOBJ_SBZ();
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
function INIT_SYNC_ANIM_TIMERS(){
	// Synchronized Animation Variables
	globalvar sync0_time;  sync0_time=0;	// Timer for GHZ Spiked Log
	globalvar sync0_frame; sync0_frame=0;	// Frame number for GHZ Spiked Log
	globalvar sync1_time;  sync1_time=0;	// Timer for Rings & Giant Rings
	globalvar sync1_frame; sync1_frame=0;	// Frame number for Rings & Giant Rings
	globalvar sync2_time;  sync2_time=0;	// Timer for ???
	globalvar sync2_frame; sync2_frame=0;	// Frame number for ???
	globalvar sync3_time;  sync3_time=0;	// Timer for Lost Rings
	globalvar sync3_frame; sync3_frame=0;	// Frame number for Lost Rings
}
function INIT_OBJDATA_LOSTRINGS(){
	globalvar ringspeed;
	ringspeed[0] = [-0.78,-3.92];
	ringspeed[1] = [0.78,-3.92];
	ringspeed[2] = [-2.22,-3.33];
	ringspeed[3] = [2.22,-3.33];
	ringspeed[4] = [-3.33,-2.22];
	ringspeed[5] = [3.33,-2.22];
	ringspeed[6] = [-3.92,-0.78];
	ringspeed[7] = [3.92,-0.78];
	ringspeed[8] = [-3.92,0.78];
	ringspeed[9] = [3.92,0.78];
	ringspeed[10] = [-3.33,2.22];
	ringspeed[11] = [3.33,2.22];
	ringspeed[12] = [-2.22,3.33];
	ringspeed[13] = [2.22,3.33];
	ringspeed[14] = [-0.78,3.92];
	ringspeed[15] = [0.78,3.92];
	ringspeed[16] = [-0.39,-1.96];
	ringspeed[17] = [0.39,-1.96];
	ringspeed[18] = [-1.11,-1.66];
	ringspeed[19] = [1.11,-1.66];
	ringspeed[20] = [-1.66,-1.11];
	ringspeed[21] = [1.66,-1.11];
	ringspeed[22] = [-1.96,-0.39];
	ringspeed[23] = [1.96,-0.39];
	ringspeed[24] = [-1.96,0.39];
	ringspeed[25] = [1.96,0.39];
	ringspeed[26] = [-1.66,1.11];
	ringspeed[27] = [1.66,1.11];
	ringspeed[28] = [-1.11,1.66];
	ringspeed[29] = [1.11,1.66];
	ringspeed[30] = [-0.39,1.96];
	ringspeed[31] = [0.39,1.96];
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
function INIT_OBJDATA_HEIGHTMAPS(){
	globalvar heightmap_obj1A;	// Crumbling ledges
	heightmap_obj1A[0] = [	32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
							32, 32, 32, 32, 32, 32, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36,
							37, 37, 38, 38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43, 44, 44,
							45, 45, 46, 46, 47, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
							48, 48, 48, 48, 48, 48, 48, 48, 48, 48]; // 10 Extra byte at the beginning and 10 at the end
	heightmap_obj1A[1] = [];
	var ar = heightmap_obj1A[0];
	for (var i = array_length(ar) - 1; i >= 0; i--)
		array_push(heightmap_obj1A[1], ar[i]);
}
function INIT_OBJDATA_SMASHFRAGS(){
	globalvar fragspeed;
	fragspeed[0] = [4,-5];
	fragspeed[1] = [6,-1];
	fragspeed[2] = [6,1];
	fragspeed[3] = [4,5];
	fragspeed[4] = [6,-6];
	fragspeed[5] = [8,-2];
	fragspeed[6] = [8,2];
	fragspeed[7] = [6,6];
}
function INIT_OBJDATA_TITLECARDS(){
	global.TtlCard_ConData = array_create(11);
	global.TtlCard_ItemY = [80, 100, 102, 76]; // Zone name, ZONE, Act X, Oval
	
	global.TtlCard_ConData[ZONE_GHZ] = {
		name		: "GREEN HILL",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_BZ] = {
		name		: "BRIDGE",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_MZ] = {
		name		: "MARBLE",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_JZ] = {
		name		: "JUNGLE",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_SYZ] = {
		name		: "SPRING YARD",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_LZ] = {
		name		: "LABYRINTH",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_SLZ] = {
		name		: "STAR LIGHT",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_SBZ] = {
		name		: "SCRAP BRAIN",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_SKBZ] = {
		name		: "SKY BASE",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_MGHZ] = {
		name		: "MECHA GREEN HILL",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}
	global.TtlCard_ConData[ZONE_MGHZ+1] = {
		name		: "FINAL",
		name_mainx	:	 136,
		zone_mainx	:	 208,
		acts_mainx	:	 244,
		oval_mainx	:	 236
	}

	global.GotCard_ConData = array_create(14);
	
	global.GotCard_ConData[PL_SONIC] = {
		text	: "SONIC HAS",
		mainx	:	 144,
		mainy	:	  72
	}
	global.GotCard_ConData[PL_TAILS] = {
		text	: "TAILS HAS",
		mainx	:	 148,
		mainy	:	  72
	}
	global.GotCard_ConData[PL_KNUCKLES] = {
		text	: "KNUCKLES HAS",
		mainx	:	 138,
		mainy	:	  72
	}
	global.GotCard_ConData[PL_AMY] = {
		text	: "AMY HAS",
		mainx	:	 150,
		mainy	:	  72
	}
	global.GotCard_ConData[PL_MIGHTY] = {
		text	: "MIGHTY HAS",
		mainx	:	 140,
		mainy	:	  72
	}
	global.GotCard_ConData[PL_RAY] = {
		text	: "RAY HAS",
		mainx	:	 150,
		mainy	:	  72
	}
	global.GotCard_ConData[PL_METAL] = {
		text	: "METAL HAS",
		mainx	:	 144,
		mainy	:	  72
	}
	// "PASSED"
	global.GotCard_ConData[PL_METAL+1] = {
		text	:	  "",
		mainx	:	 164,
		mainy	:	  92
	}
	// ACT X
	global.GotCard_ConData[PL_METAL+2] = {
		text	:	  "",
		mainx	:	 232,
		mainy	:	  94
	}
	// OVAL
	global.GotCard_ConData[PL_METAL+3] = {
		text	:	  "",
		mainx	:	 232,
		mainy	:	  64
	}
	// SCORE
	global.GotCard_ConData[PL_METAL+4] = {
		text	:	  "",
		mainx	:	 132,
		mainy	:	 112
	}
	// TIME BONUS
	global.GotCard_ConData[PL_METAL+5] = {
		text	:	  "",
		mainx	:	 132,
		mainy	:	 128
	}
	// RING BONUS
	global.GotCard_ConData[PL_METAL+6] = {
		text	:	  "",
		mainx	:	 132,
		mainy	:	 144
	}
	// COOL BONUS
	global.GotCard_ConData[PL_METAL+7] = {
		text	:	  "",
		mainx	:	 132,
		mainy	:	 160
	}
}
function INIT_SOUND_SYSTEM(){
	instance_create_layer(0, 3, "Core", Core_Music);
	global.default_track	= BGM_tracks.Title;
	global.ring_pan = 0;	// Alternates between 0 (left) and 1 (right);

	// Database of BGM tracks and loop data
	global.BGM_list = array_create(BGM_tracks.total)
	
	global.BGM_list[BGM_tracks.Title] = {
		ID			: bgm_Title,
		loop_start	: -1,	// -1 = No loop
		loop_end	: 8.78
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.LevelSelect] = {
		ID			: bgm_LevSel,
		loop_start	: 0,
		loop_end	: 38.39
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.GHZ1] = {
		ID			: bgm_GHZ1,
		loop_start	: 14.512,
		loop_end	: 52.966
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.GHZ2] = {
		ID			: bgm_GHZ2,
		loop_start	: 14.414,
		loop_end	: 52.812
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.BZ1] = {
		ID			: bgm_BZ1,
		loop_start	: 0.0,
		loop_end	: 25.79
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.BZ2] = {
		ID			: bgm_BZ1,
		loop_start	: 0.0,
		loop_end	: 25.79
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.MZ1] = {
		ID			: bgm_MZ1,
		loop_start	: 2.156,
		loop_end	: 38.256
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.MZ2] = {
		ID			: bgm_MZ2,
		loop_start	: 1.999,
		loop_end	: 48.782
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.JZ1] = {
		ID			: bgm_JZ1,
		loop_start	: 0.0,
		loop_end	: 42.68
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.JZ2] = {
		ID			: bgm_JZ1,
		loop_start	: 0.0,
		loop_end	: 42.68
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SYZ1] = {
		ID			: bgm_SYZ1,
		loop_start	: 2.480,
		loop_end	: 40.930
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SYZ2] = {
		ID			: bgm_SYZ2,
		loop_start	: 2.306,
		loop_end	: 40.694
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.LZ1] = {
		ID			: bgm_LZ1,
		loop_start	: 1.932,
		loop_end	: 36.536
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.LZ2] = {
		ID			: bgm_LZ2,
		loop_start	: 0.000,
		loop_end	: 53.772
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SLZ1] = {
		ID			: bgm_SLZ1,
		loop_start	: 1.520,
		loop_end	: 43.807
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SLZ2] = {
		ID			: bgm_SLZ2,
		loop_start	: 3.125,
		loop_end	: 45.358
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SBZ1] = {
		ID			: bgm_SBZ1,
		loop_start	: 0.173,
		loop_end	: 72.260
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SBZ2] = {
		ID			: bgm_SBZ2,
		loop_start	: 3.208,
		loop_end	: 60.809
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SBZ3] = {
		ID			: bgm_SBZ3,
		loop_start	: 4.014,
		loop_end	: 76.012
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.FZ] = {
		ID			: bgm_FZ,
		loop_start	: 1.977,
		loop_end	: 21.206
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SKBZ1] = {
		ID			: bgm_SkBZ1,
		loop_start	: 1.977,
		loop_end	: 21.206
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.SKBZ2] = {
		ID			: bgm_SkBZ1,
		loop_start	: 1.977,
		loop_end	: 21.206
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.Boss] = {
		ID			: bgm_Boss,
		loop_start	: 1.977,
		loop_end	: 21.206
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.ActClear] = {
		ID			: bgm_ActClear,
		loop_start	: -1,	// -1 = No loop
		loop_end	: 6.03
	}
	// ==================================================================================
	global.BGM_list[BGM_tracks.Invinc] = {
		ID			: bgm_Invinc,
		loop_start	: 0.94,
		loop_end	: 11.95
	}
}
function INIT_LEVEL_SELECT(){
	// Level Select Screen Information
	global.font_levsel = font_add_sprite(spr_font, ord("!"), false, 0);
	global.LevSelect_Data = array_create(LevSel_items.total)
	var ix = 40, iy = 40;
	
	global.LevSelect_Data[LevSel_items.GHZ1] = {
		txt		: "GREEN HILL ZONE  1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.SBZ1,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.GHZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.SBZ2,
		level	: rm_GHZ2
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.BZ1] = {
		txt		: "BRIDGE ZONE      1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.SBZ3,
		level	: rm_BZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.BZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.SkBZ1,
		level	: rm_BZ2
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.MZ1] = {
		txt		: "MARBLE ZONE      1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.SkBZ2,
		level	: rm_MZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.MZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_MZ2
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.JZ1] = {
		txt		: "JUNGLE ZONE      1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_JZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.JZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_JZ2
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SYZ1] = {
		txt		: "SPRING YARD ZONE 1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SYZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_GHZ1
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.LZ1] = {
		txt		: "LABYRINTH ZONE   1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.LZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_GHZ1
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SLZ1] = {
		txt		: "STAR LIGHT ZONE  1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SLZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.Char,
		level	: rm_GHZ1
	} ix = 224; iy = 40;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SBZ1] = {
		txt		: "SCRAP BRAIN ZONE 1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.GHZ1,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SBZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.GHZ2,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SBZ3] = {
		txt		: "                 3",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.BZ1,
		level	: rm_GHZ1
	} iy+=16;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SkBZ1] = {
		txt		: "SKY BASE ZONE    1",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.BZ2,
		level	: rm_GHZ1
	} iy+=8;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.SkBZ2] = {
		txt		: "                 2",
		pos_x	: ix,
		pos_y	: iy,
		across	: LevSel_items.MZ1,
		level	: rm_GHZ1
	} iy+=32;
	// ==================================================================================
	global.LevSelect_Data[LevSel_items.Char] = {
		txt		: "CHARACTER         ",
		pos_x	: ix,
		pos_y	: iy,
		across	: -1, // No opposite items. Left/Right has unique controls
		level	: -1  // No level access here
	} iy+=16;
	// ==================================================================================
}
function INIT_MISC_VARS(){
	// Global Gameplay object handles
	globalvar player;			player = -1;			// Global handle for player object
	globalvar cam;				cam = -1;				// Global handle for the camera
	globalvar debug;			debug = false;			// by default, disable debug
	globalvar zone;				zone = 0;
	globalvar act;				act = 0;

	globalvar playermode;		playermode = PL_SONIC;	// Global var set to handle player selection
	globalvar obj_Players;		obj_Players = array_create(7);
	// Object indices for player characters
	{
		obj_Players[PL_SONIC] = obj01_Sonic;
		obj_Players[PL_TAILS] = obj01_Tails;
		obj_Players[PL_KNUCKLES] = obj01_Knuckles;
		obj_Players[PL_AMY] = obj01_Amy;
		obj_Players[PL_MIGHTY] = obj01_Mighty;
		obj_Players[PL_RAY] = obj01_Ray;
		obj_Players[PL_METAL] = obj01_Metal;
	}
	globalvar HUDFONT;          HUDFONT = font_add_sprite(spr_HUDnumbers,ord("0"),false,0);	// Numerical HUD Font
	globalvar CARDFONT;			CARDFONT = font_add_sprite(spr_titlecard,ord("A"),true,1);	// Alphabetical Card Font
	globalvar f_levelstarted;	f_levelstarted=false;	// IF true, we can start playing (and pausing).
	globalvar f_pause;          f_pause=false;			// Game Pausing flag
	globalvar f_restart;		f_restart=false;		// Are we restarting a level (from death)
	globalvar f_timecount;      f_timecount=false;		// Time counter update flag

	globalvar centiseconds;							// Precalculated centiseconds
	for (var i=0; i<60; i++)	centiseconds[i] = round(100*(i/60));

	globalvar framecount;		framecount=0;		// Frame timer
	globalvar p_score;          p_score=0;          // Player's score
	globalvar p_time;           p_time=0;           // Playing time
	globalvar p_rings;          p_rings=0;          // Player's rings
	globalvar p_lives;          p_lives=3;          // Player's lives
	globalvar p_scorelife;      p_scorelife=50000;  // Amount of points needed for an extra life
	globalvar p_ringlife;       p_ringlife=0;       // Counter for extra lives per rings

	globalvar f_endactbonus;	f_endactbonus=false; // When this flag is set, bonuses will be applied.
	globalvar itembonus;        itembonus=0;        // The counter that determines the number of points received when destroying enemies or objects.
	globalvar timebonus;        timebonus=0;        // The points counter for time bonuses. The faster you complete a level, the higher the bonus. TIME OVER results in NO bonus.
	globalvar ringbonus;        ringbonus=0;        // The points counter for ring bonuses. You get 100 pts per ring when you complete a level.
	globalvar coolbonus;		coolbonus=0;		// The points counter for cool bonuses. You get more points the fewer times you get hit.
	globalvar timeover;			timeover=0;			// if 1, player had a time over and will receive no time bonus.
	globalvar gravity_angle;    gravity_angle=0;    // The global zone gravity. Character gravity is based on this.

	// Water related values
	globalvar water_flag;       water_flag=false;   // Flag for plane-spanning water in the zone.
	globalvar water_pos1;       water_pos1=0;       // Water Height - Actual
	globalvar water_pos2;       water_pos2=0;       // Water Height - Ignoring Water Sway
	globalvar water_pos3;       water_pos3=0;       // Water Height - Next Target
	globalvar wtunnel_flag;     wtunnel_flag=0;     // Flag for wind/water tunnel currents
	
	// Lamppost related values
	globalvar lamp_last;		lamp_last=0;		// ID (subtype) of the last lamp hit.
	globalvar lamp_xpos;		lamp_xpos=0;		// x-axis for Sonic to respawn at lamppost
	globalvar lamp_ypos;		lamp_ypos=0;		// y-axis for Sonic to respawn at lamppost
	globalvar lamp_rings;		lamp_rings=0;		// rings count stored at lamppost
	globalvar lamp_time;		lamp_time=0;		// time stored at lamppost
	globalvar lamp_dle;			lamp_dle=0;			// dynamic level event routine counter at lamppost
	globalvar lamp_limitbtm2;	lamp_limitbtm2=0;	// level bottom boundary at lamppost
	globalvar lamp_scrx;		lamp_scrx=0;		// x-axis screen at lamppost
	globalvar lamp_scry;		lamp_scry=0;		// y-axis screen at lamppost
	globalvar lamp_wtrpos;		lamp_wtrpos=0;		// water position at lamppost
	globalvar lamp_wtrrout;		lamp_wtrrout=0;		// water routine at lamppost
	globalvar lamp_wtrstat;		lamp_wtrstat=0;		// water state at lamppost
	globalvar lamp_lives;		lamp_lives=0;		// lives count stored at lamppost
	globalvar start_score;		start_score=0;		// score saved at start of level, or at lamppost
}