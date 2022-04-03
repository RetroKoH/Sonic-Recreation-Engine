/// @description Animation Viewing
if !enabled exit;

if !active {
	if global.k_st_p {
		active = true;	// Need to activate a second flag to set automatically, or it'll immediately start playing
	}
	
	if keyboard_check_pressed(vk_escape) {
		enabled = false;	// This shouldn't ever be reached, but we'll leave it just in case
	}
}

else {
	if playing
	{
			if global.k_st_p {
			playing = false;
		}
	}

	else {
		if global.k_u_p {
			anim_set--;
			if (anim_set == -1) anim_set = total-1;
			anim_index = 0;							// Reset index
			event_user(0);							// Reset data for new set
			max_index = array_length(anim_table);	// Get the total number of animations in the set
		}
		if global.k_d_p {
			anim_set++
			if (anim_set == total) anim_set = 0;
			anim_index = 0;							// Reset index
			event_user(0);							// Reset data for new set
			max_index = array_length(anim_table);	// Get the total number of animations in the set
			                                                                                                                                                             	// Get the total number of animations in the set
		}
		if global.k_l_p {
			anim_index--;
			if (anim_index == -1) anim_index = max_index-1;
			event_user(0);	// Reset data for new index
		}
		if global.k_r_p {
			anim_index++;
			if (anim_index == max_index) anim_index = 0;
			event_user(0);	// Reset data for new index
		}

		if keyboard_check_pressed(vk_escape) {
			active = false;
			enabled = false;
		}

		if global.k_st_p {
			playing = true;
		}
	}
}