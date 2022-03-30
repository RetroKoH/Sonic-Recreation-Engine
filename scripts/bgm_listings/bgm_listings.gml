// Enums shared across all playable characters
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

// Database of BGM tracks
function bgm_listings(){
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