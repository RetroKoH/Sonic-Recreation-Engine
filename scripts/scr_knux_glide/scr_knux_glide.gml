function scr_knux_glide(){
	scr_knux_move_glide();			// Glide movement
	scr_player_level_bound();		// Interactions with camera planes
	scr_apply_speed(false);			// SpeedToPos
	scr_knux_glide_control();		// Glide Controls
}

function scr_knux_move_glide(){
	if double_jump_flag == 1 {
		// Acceleration - If gliding straight, accel to a rate of 24 px/s.
		if (gsp < 24) && !(abs(double_jump_property) mod 180) {
			var spd=0.015625; if (gsp<2) spd*=2;	// Accelerate 2x at lower speed
			gsp+=spd; if (gsp>24) gsp=24;			// Cap glide speed at 24.
		}
		
		// Steering control
		var turn=(global.k_r_h-global.k_l_h);
		if turn!=0 glide_direction=turn;
		
		// Turning
		double_jump_property = clamp(double_jump_property - (2.8125 * glide_direction), 0, 180); // clamp(); or median();
		
		// Set Glide Speed
		xsp=gsp*cos(degtorad(double_jump_property));
		
		// Glide Gravity
		if (ysp < 0.5) ysp += 0.125;
		else ysp -= 0.125; // if (ysp >= 0.5)
	}
}

function scr_knux_glide_control(){
	switch(double_jump_flag){
		case 1: // NORMAL GLIDE - Complete (Fix turning animation)
		{
			scr_knux_check_floor_special();
			if !(glide_collision_prop&STA_INAIR) scr_knux_glide_hitfloor(); // Begin sliding
			else if (glide_collision_prop&STA_PUSH) scr_knux_glide_hitwall(); // Begin climbing
			else {
				if !(global.k_abc_h) {
					double_jump_flag = 2; // Begin falling if button's not held
					anim_ID = anim_player.fall;
					if xsp<0 status|=STA_FACING else status&=~STA_FACING;
					xsp*=0.25;
					height=defaultHeight;
					width=WIDTH_MAIN;
				} else knux_glide_set_anim_frame();
			}
		}
		break;
		case 2: // FALLING FROM GLIDE (Complete)
		{
			scr_player_move_air();							// Air movement and air drag
			ysp += !(status&STA_WATER) ? .21875 : .0625;	// Gravity
			scr_knux_check_floor_special();
			if !(glide_collision_prop&STA_INAIR){
				gsp = 0;
				xsp = 0;
				ysp = 0;
				y += (height - HEIGHT_MAIN);
				scr_player_acquirefloor();
				if !(col_angle > 22.5 && col_angle <= 337.5) { // On flat floor
					move_lock = $F;
					anim_ID = anim_player.landing;
				}
			}
		}
		break;
		case 3: // SLIDING
		{
			if (global.k_abc_h) {
				var dir = sign(xsp);
				xsp -= (0.125*dir);		// Subtracts if going right. Adds if going left
				if xsp*dir > 0 {		// if greater than 0 (dir==1) or less than 0 (dir==-1)
					// Continue Sliding
					scr_knux_check_floor_special();
					var dist = scr_player_get_floor_dist(0);
					if dist < 14 {
						y += dist;
						angle = col_angle;
						// Play Ground Slide sfx every 8 frames
					}
					else { // fall
						double_jump_flag = 2;
						anim_ID = anim_player.fall;
						height = defaultHeight;
						width = WIDTH_MAIN;
						glide_collision_prop|=STA_INAIR;
					}
				}
				else {
					// Get Up
					gsp = 0;
					xsp = 0;
					ysp = 0;
					y -= defaultHeight-height;
					scr_player_acquirefloor();
					move_lock = $F;
					anim_ID = anim_player.getup;
				}
			} else {
					// Get Up
					gsp = 0;
					xsp = 0;
					ysp = 0;
					y -= defaultHeight-height;
					scr_player_acquirefloor();
					move_lock = $F;
					anim_ID = anim_player.getup;
			}
		}
		break;
		case 4: // CLIMBING WALL
		{
			if (wall_grab_disabled) || (x != wall_grab_initial_x) || (status&STA_ONOBJ)
				scr_knux_let_go_of_wall();
			else {
				gsp = 0;
				xsp = 0;
				ysp = 0;
				var move = (global.k_d_h - global.k_u_h);	// Movement based on key control.
				var has_moved = 0; // Will be 1 or -1 if we've moved.
				
				if (move==-1){
					// Climbing up
					var dist = scr_get_distance_from_wall(y-11);
					if (dist >= 4) scr_knux_climbup();
					if (dist == 0){
						var c_dist = scr_get_ceiling_dist(x,y-8,0);
						if (c_dist <= 0) y-=c_dist; // ; Knuckles is bumping into the ceiling, so push him out.
						// Finish moving at this point...
						else{
							y--; if (super) y--; // Super Knuckles climbs twice as fast.
							// Keep below top boundary
						} // finish moving at this point
					}
					else{ // If Knuckles has encountered a small dip in the wall, then make him stop
					}
				}
				else if (move==1){
					// Climbing down
					var dist = scr_get_distance_from_wall(y+11);
					if (dist == 0) scr_knux_let_go_of_wall(); // If Knuckles has climbed off the bottom of the wall, make him let go.
					else{
						var f_dist = scr_get_ceiling_dist(x,y+9,0);
						if (f_dist <= 0) { // Knuckles has reached the floor.
							y += f_dist;
							angle = col_angle;
							gsp = 0;
							xsp = 0;
							ysp = 0;
							scr_player_acquirefloor();
							anim_ID = anim_player.idle;
						}
						else { // if Knuckles has room below him, climb down
							y++; if (super) y++; // Super Knuckles climbs twice as fast.
						} // finish moving at this point
					}
				}
				// Finish moving
				if (has_moved!=0){
					double_jump_property--;
					if double_jump_property==0 {
						double_jump_property=3;
						anim_framemod += has_moved;						// Add delta to animation frame.
						if (anim_framemod < 0) anim_framemod = 5;
						else if (anim_framemod > 5) anim_framemod = 0;	// Loop animation
					}
				} // If we haven't moved, check for jumping
				else if (global.k_abc_p){
					ysp = -3.5;
					xsp = (status&STA_FACING) ? 4 : -4;
					status |= STA_INAIR;
					jump = true;
					height = HEIGHT_ROLL;
					width = WIDTH_ROLL;
					anim_ID = anim_player.roll;
					status |= STA_SPIN;
					double_jump_flag = 0;
				}
			}
		}
		break;
		case 5: // CLIMBING UP
		break;
	}
}

function scr_knux_glide_hitfloor(){
	if xsp<0 status|=STA_FACING else status&=~STA_FACING;
	if (col_angle > 22.5 && col_angle <= 337.5)
	{
		// Don't slide if on steep ground
		xsp = gsp;
		ysp = 0;
		scr_player_acquirefloor();
	}
	else {
		// Slide if in floor mode.
		double_jump_flag = 3;
		anim_ID=anim_player.slide;
	}
}

function scr_knux_glide_hitwall(){
	if !(wall_grab_disabled){
		gsp = 0;
		xsp = 0;
		ysp = 0;
		double_jump_flag = 4;		// Set to climbing
		double_jump_property = 3;	// Check what prop is supposed to do when climbing
		anim_ID = anim_player.climb;
		wall_grab_initial_x = x;
	}
	else{
		double_jump_flag = 2;
		anim_ID = anim_player.fall;
		height = defaultHeight;
		width = WIDTH_MAIN;
		glide_collision_prop |= STA_INAIR;
	}
}

function scr_knux_let_go_of_wall(){
	double_jump_flag = 2;
	anim_ID = anim_player.fall;
	height = defaultHeight;
	width = WIDTH_MAIN;
}

function scr_knux_climbup(){
	double_jump_flag = 5;
	// Animation related code to be put here.
}

function scr_get_distance_from_wall(sensor_y){
	if (status&STA_FACING)
		return scr_get_left_wall_dist(x-1,sensor_y,0);
	else
		return scr_get_right_wall_dist(x+1,sensor_y,0);
}