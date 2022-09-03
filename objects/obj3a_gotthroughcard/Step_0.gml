/// @description Insert description here
// You can write your code in this editor
/// @description Title Card Routines
switch(routine){
	case 0:
		routine++;
		
		// Set positions for each subsprite (Multiplied by screen scale)
		xpos[0] = -(((string_length(char_name)*16)*3)+16);
		start_x[0] = xpos[0];
		main_x[0] = global.GotCard_ConData[playermode].mainx * 3;
		ypos[0] = global.GotCard_ConData[playermode].mainy * 3; 
		
		xpos[1] = -(((string_length("PASSED")*16)*3)+16);
		start_x[1] = xpos[1];
		main_x[1] = global.GotCard_ConData[PL_METAL+1].mainx * 3;
		
		// ACT X
		xpos[2] = (424*3)+32;
		start_x[2] = xpos[2];
		main_x[2] = global.GotCard_ConData[PL_METAL+2].mainx * 3;
		
		// OVAL
		xpos[3] = (424*3)+32;
		start_x[3] = xpos[3];
		main_x[3] = global.GotCard_ConData[PL_METAL+3].mainx * 3;

		// SCORE
		xpos[4] = (424*3)+32;
		start_x[4] = xpos[4];
		main_x[4] = global.GotCard_ConData[PL_METAL+4].mainx * 3;

		// TIME BONUS
		xpos[5] = (424*3)+32;
		start_x[5] = xpos[5];
		main_x[5] = global.GotCard_ConData[PL_METAL+5].mainx * 3;
		
		// RING BONUS
		xpos[6] = (424*3)+32;
		start_x[6] = xpos[6];
		main_x[6] = global.GotCard_ConData[PL_METAL+6].mainx * 3;
		
		// COOL BONUS
		xpos[7] = (424*3)+32;
		start_x[7] = xpos[7];
		main_x[7] = global.GotCard_ConData[PL_METAL+7].mainx * 3;
		for (var i = 1; i < 8; i++)
			ypos[i] = global.GotCard_ConData[PL_METAL+i].mainy * 3;
		
		if (act_flag)	act_num = act;
		else			act_num = -1;
		visible=true;
	break;
	
	case 1: // Move into position
		for (var i = 0; i < 8; i++) {
			if !(finished&(1<<i)){
				var diff = main_x[i] - xpos[i];
				if (diff != 0){
					if (abs(diff) < 32) xpos[i] = main_x[i];
					else if (diff < 0) xpos[i] -= 32;
					else xpos[i] += 32;
				}
				else finished |= (1<<i);
			}
		}
		if (finished == $FF){
			routine++;
			timer=150;
		}
	break;
	
	case 2:	// Timer to score tally
		timer--;
		if (timer==0) routine++;
	break;
	
	case 3: // Quickly apply score bonuses
		routine++;
		timer = 120;
		p_score += timebonus + ringbonus + coolbonus;
		timebonus = 0;
		ringbonus = 0;
		coolbonus = 0;
		audio_play_sound(sfx_EndTally,1,false);
	break;
	
	case 4: // Timer to go away
		timer--;
		if (timer==0){
			routine++;
			finished = 0;
		}
	break;
	
	case 5:
		scr_lamp_data_reset();
		start_score = p_score;
		scr_trigger_fade(rm_GHZ2, true);
	break;
	
	/*case 5: // Make pieces go away
		for (var i = 0; i < 8; i++) {
			var diff = start_x[i] - xpos[i];
			if (diff != 0){
				if (abs(diff) < 64) xpos[i] = start_x[i];
				else if (diff > 0) xpos[i] += 64;
				else xpos[i] -= 64;
			}
			else finished[i] = true;
		}
		//for (i = 0; i < 8; i++) if (finished[i]==false) break;
		else {
			instance_destroy();
		}*/
	//break;
}