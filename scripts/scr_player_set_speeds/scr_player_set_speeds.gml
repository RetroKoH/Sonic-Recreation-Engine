function scr_player_set_speeds(){
	if (object_index == obj01_Amy){
		topspeed	= 5.5;		// Maximum X speed via acceleration.
		accel_run	= 0.046875;	// X-Acceleration rate.
		decel_run	= 0.5;		// X-Deceleraction rate.
	} else {
		topspeed	= 6;
		accel_run	= 0.046875;
		decel_run	= 0.5;
	}
	if (powerups&POW_SHOES){
		topspeed*=2;
		accel_run*=2;
	}
	if (status&STA_WATER){
		topspeed/=2;
		accel_run/=2;
		decel_run/=2;
	}
}