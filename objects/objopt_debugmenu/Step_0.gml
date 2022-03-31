/// @description Insert description here

if !active {
	if global.k_l_p {
		objopt[option].visible = false;
		if option == 0 option = 4;
		else option--;
		objopt[option].visible = true;
	}
	if global.k_r_p {
		objopt[option].visible = false;
		if option == 4 option = 0;
		else option++;
		objopt[option].visible = true;
	}
	if global.k_st_p {
		objopt[option].enabled = true;
		active = true;
	}
		
	if keyboard_check_pressed(vk_escape) {
		scr_trigger_fade(rm_title);
	}
}
else {
	if keyboard_check_pressed(vk_escape) {
		objopt[option].enabled = false;
		active = false;
	}
}
