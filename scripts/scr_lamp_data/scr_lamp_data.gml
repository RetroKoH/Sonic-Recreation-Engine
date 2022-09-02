function scr_lamp_data_save(i){
	lamp_last = i;			// Set the last lamppost
	lamp_xpos = x;
	lamp_ypos = y;
	lamp_rings = p_rings;	// Store ring count
	lamp_time = p_time;		// Store current time
}

function scr_lamp_data_load(){
	player.x = lamp_xpos;
	player.y = lamp_ypos;
	p_rings = lamp_rings;
	p_time = lamp_time;
}