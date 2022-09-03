function scr_lamp_data_save(i){
	lamp_last = i;					// Set the last lamppost
	lamp_xpos = x;					// Store start position
	lamp_ypos = y;
	lamp_rings = p_rings;			// Store ring count
	lamp_time = p_time;				// Store current time
	lamp_limitbtm2 = v_limitbtm2;	// Store lower boundary
	lamp_scrx = camera_get_view_x(cam.view);
	lamp_scry = camera_get_view_y(cam.view);
}

function scr_lamp_data_load(){
	player.x = lamp_xpos;
	player.y = lamp_ypos;
	p_rings = lamp_rings;
	p_time = lamp_time;
	lamp_limitbtm2 = v_limitbtm2;	// Store lower boundary
	// Camera position set elsewhere
}

function scr_lamp_data_reset(){
	lamp_last = 0;
	lamp_xpos = 0;
	lamp_ypos = 0;
	lamp_rings = 0;
	lamp_time = 0;
	lamp_limitbtm2 = 0;
	lamp_scrx = 0;
	lamp_scry = 0;
}