/// @description Insert description here
// You can write your code in this editor

if instance_exists(Core_Level) && !(fading) && (f_levelstarted)
	if (f_pause)
	{
		if (global.k_st_p)
		{
			f_pause					= false;	// Clear Global Pause flag
			Core_Level.run_objects	= true;		// In-Game objects are no longer suspended
			Core_Level.time_running	= true;		// Timers resume
			audio_resume_all();
		}
	}
	else if (global.k_st_p)
	{
		f_pause						= true;		// Set Global Pause flag
		Core_Level.run_objects		= false;	// In-Game objects are suspended
		Core_Level.time_running		= false;	// Timer pauses (as should framecount, Osc timing, and Sync anim timing) 
		audio_pause_all();						// Pause all existing audio
	}