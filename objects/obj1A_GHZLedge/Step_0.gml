/// @description Ledge Routines

switch(routine){
	case 0: // Ledge_Init
		routine++;
		collapse_timer=7;
		collapsing=false;
		col_array=heightmap_obj1A[image_index];
	break;

	case 1: // Ledge_Touch
		if (collapsing) {
			if (collapse_timer) collapse_timer--;
			else {collapsing=false; routine=3; exit;}// else {collapsing=false; scr_floor_collapse(); exit;}
		}
		collide = scr_topsolid_obj_slope($30, col_array, prev_x);
		if (collide) routine++;
	break;

	case 2: // Ledge_Collapse
	if (collapse_timer) {collapsing=true; collapse_timer--;}
	else routine=3;//else scr_floor_collapse();
	// Fallthrough
	case 5: // Ledge_WalkOff
		collide = scr_topsolid_obj_slope($30, col_array, prev_x);
		if !(collide) routine=1;
	break;

	case 3: // Ledge_Display
		if (collapse_timer==0)	routine=4;//scr_apply_speed(true);
		else {
			if !(collapsing) collapse_timer--;
			else {
				collapse_timer--;
				collide = scr_topsolid_obj_slope($30, col_array, prev_x);
				if !(collide){
					collapsing=false;
					routine=3;
				}
				else{
					if (collapse_timer==0){
						player.status&=~STA_ONOBJ;
						player.status&=~STA_PUSH;
						collapsing=false;
						routine=3;
					}
				}
			}
		}
	break;

	case 4: // Ledge_Delete
		instance_destroy();
		// Remove these and correctly branch to above
		audio_play_sound(sfx_CrumblingLedge,1,false);
		player.status&=~STA_ONOBJ;
		player.status&=~STA_PUSH;
	break;
}
