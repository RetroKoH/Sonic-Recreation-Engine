/// @description Title Card Routines

switch(routine){
	case 0:
		routine++;
		
		// Set positions for each subsprite (Multiplied by screen scale)
		xpos[0] = -(((string_length(zone_name)*16)*3)+16);
		start_x[0] = xpos[0];
		main_x[0] = global.TtlCard_ConData[zone].name_mainx * 3;
		
		xpos[1] = -(((string_length("ZONE")*16)*3)+16);
		start_x[1] = xpos[1];
		main_x[1] = global.TtlCard_ConData[zone].zone_mainx * 3;
		
		xpos[2] = (424*3)+32;
		start_x[2] = xpos[2];
		main_x[2] = global.TtlCard_ConData[zone].acts_mainx * 3;
		
		xpos[3] = (424*3)+32;
		start_x[3] = xpos[3];
		main_x[3] = global.TtlCard_ConData[zone].oval_mainx * 3;
		for (var i = 0; i < 4; i++)
			ypos[i] = global.TtlCard_ItemY[i]*3;
		
		if (act_flag)	act_num = act;
		else			act_num = -1;
		visible=true;
	break;
	
	case 1: // Move into position
		for (var i = 0; i < 4; i++) {
			var diff = main_x[i] - xpos[i];
			if (diff != 0){
				if (abs(diff) < 32) xpos[i] = main_x[i];
				else if (diff < 0) xpos[i] -= 32;
				else xpos[i] += 32;
			}
			else finished[i] = true;
		}
		if (finished[0] && finished[1] && finished[2] && finished[3])
		{
			routine++;
			timer=150;
		}
	break;
	
	case 2:	// Timer to fade in
		timer--;
		if (timer==0){
			routine++;
			timer=90;
			global.core_fade.load_card=false;
		}
	break;
	
	case 3: // Timer to go away
		timer--;
		if (timer==0){
			routine++;
			for (var i = 0; i < 4; i++) finished[i] = false;
		}
	break;
	
	case 4: // Make pieces go away
		for (var i = 0; i < 4; i++) {
			var diff = start_x[i] - xpos[i];
			if (diff != 0){
				if (abs(diff) < 64) xpos[i] = start_x[i];
				else if (diff > 0) xpos[i] += 64;
				else xpos[i] -= 64;
			}
			else finished[i] = true;
		}
		if (finished[0] && finished[1] && finished[2] && finished[3])
		{
			instance_destroy();
		}
	break;
}