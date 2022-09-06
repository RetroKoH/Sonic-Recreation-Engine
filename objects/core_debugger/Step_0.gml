/// @description Count down and clear lines

if (debuglog_time)
{
	debuglog_time--;
	if !debuglog_time
		scr_debug_log_delete();
}