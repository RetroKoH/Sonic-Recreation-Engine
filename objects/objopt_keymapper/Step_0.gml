/// @description Control Mapping
if !enabled exit;

// Press START to enable the menu
if option == 0 {
	if global.k_st_p
		option = 1;
}

// Enabled menu controls
else {
	if !active {
		if global.k_u_p {
			if option == 1 option = 8;
			else option--;
		}
		if global.k_d_p {
			if option == 8 option = 1;
			else option ++;
		}
		if global.k_st_p {
			active = true;
		}
		
		if keyboard_check_pressed(vk_escape) {
			option = 0;
			scr_keymap_save();
			enabled = false;
		}
	}

	else {
		if keyboard_check_pressed(vk_escape)
			active = false;
		else {
			var k = keyboard_key * keyboard_check_pressed(keyboard_key);
			if k != 0 {
				var error = false;
				
				for (var i = 0; i<=KEY_START; i++) {
					if k == keymap_array[i] error = true;
				}
				
				if !error
					if global._fhinputKeys[k] == "N/A" error = true;
				
				if !error
					keymap_array[option] = keyboard_key;
				
				active = false;
			}
		}
	}
}