// Adds to the debug log (in-game, and externally)
function scr_debug_log_add(msg){
	if debuglog != "" debuglog += "\n";

	debuglog_time = LOG_TIME;
	debuglog += msg;
	if string_count("\n",debuglog) > 2
		scr_debug_log_delete(); // Only retain 3 most recent debug messages
	show_debug_message(msg);
}