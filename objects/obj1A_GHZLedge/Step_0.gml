/// @description Ledge Routines

switch(routine){
	case 0:
		routine++;
		collapse_timer=7;
		collapsed=false;
	break;
	case 1:
		if (collapsed == false) {
			if (image_index==0) collide = scr_topsolid_obj_slope($30, heightmap_obj1A, prev_x);
			else collide = scr_topsolid_obj_slope($30, heightmap_obj1A_2, prev_x);
		}
		
	break;
}
