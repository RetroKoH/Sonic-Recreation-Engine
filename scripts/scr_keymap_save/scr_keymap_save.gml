// Saves the current keymap configuration under the given INI section
function scr_keymap_save(){
	ini_open("settings.ini");

	ini_write_real("Controls", "KEY_UP",	keymap_array[KEY_UP]); // vk_up
	ini_write_real("Controls", "KEY_DOWN",	keymap_array[KEY_DOWN]); // vk_down
	ini_write_real("Controls", "KEY_LEFT",	keymap_array[KEY_LEFT]); // vk_left
	ini_write_real("Controls", "KEY_RIGHT",	keymap_array[KEY_RIGHT]); // vk_right
	ini_write_real("Controls", "KEY_A",		keymap_array[KEY_A]); // ord("A")
	ini_write_real("Controls", "KEY_B",		keymap_array[KEY_B]); // ord("S")
	ini_write_real("Controls", "KEY_C",		keymap_array[KEY_C]); // ord("D")
	ini_write_real("Controls", "KEY_START",	keymap_array[KEY_START]); // vk_enter
	ini_write_real("Controls", "KEY_DEBUG",	keymap_array[KEY_DEBUG]); // vk_shift

	ini_close();
	scr_debug_log_add("Controls Saved to: " + "settings.ini");
}