/// @description Routine Handling

if fading exit;

// Reset sensor flags
col_sensor_A = false;
col_sensor_B = false;
col_sensor_C = false;
col_sensor_D = false;
col_sensor_E = false;
col_sensor_F = false;

switch(routine)
{
	case 0: // INIT
	{
		routine++;
		height=defaultHeight;
		width=WIDTH_MAIN;
	} break;

	case 1: // Sonic_Control
	{
		script_execute(control_modes);
		scr_player_display();
		scr_touch_response();
	} break;

	case 2: // Sonic_Hurt
		scr_apply_speed(false);
		ysp += (status&STA_WATER) ? .0625 : .1875; // Apply gravity (Slightly different in this state)
		scr_player_hurt_stop();
		scr_player_level_bound();		// Keep Sonic inside the view and kill Sonic if he touches the kill plane
	break;
	
	case 3: // Sonic_Death
		if (y > camera_get_view_y(global.cam.view)+$120)
		{
			ysp=0.21875;
			routine++;
			f_timecount = false;
			p_lives--;
			restart_timer=60;
		}
		scr_apply_speed(true);			// ObjectFall
	break;
	
	case 4: // Sonic_Restart
		if (restart_timer) restart_timer--;
		if !(restart_timer) {
			f_restart = true; // Restarting the level
			scr_trigger_fade(room, true);
		}
	break;
}

// Handle move_angle
if xsp == 0 && ysp == 0
	move_angle = 0
else
	move_angle = scr_wrap_angle(point_direction(x,y,x+xsp,y+ysp)+90);