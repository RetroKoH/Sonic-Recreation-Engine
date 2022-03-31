function scr_debug_log_delete(){
	if !string_count("\n",debuglog) debuglog="";
	else debuglog = string_delete(debuglog,1,string_pos("\n",debuglog)); // Delete from char 0 to the first \n
	if debuglog != ""
		debuglog_time = LOG_TIME;
}