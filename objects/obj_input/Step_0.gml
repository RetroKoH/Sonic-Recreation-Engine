/// @description Set input based on key presses.
global.k_u_h=keyboard_check(keymap_array[KEY_UP]);
global.k_u_p=keyboard_check_pressed(keymap_array[KEY_UP]);
global.k_d_h=keyboard_check(keymap_array[KEY_DOWN]);
global.k_d_p=keyboard_check_pressed(keymap_array[KEY_DOWN]);
global.k_l_h=keyboard_check(keymap_array[KEY_LEFT]);
global.k_l_p=keyboard_check_pressed(keymap_array[KEY_LEFT]);
global.k_r_h=keyboard_check(keymap_array[KEY_RIGHT]);
global.k_r_p=keyboard_check_pressed(keymap_array[KEY_RIGHT]);

global.k_a_h=keyboard_check(keymap_array[KEY_A]);
global.k_a_p=keyboard_check_pressed(keymap_array[KEY_A]);
global.k_a_r=keyboard_check_released(keymap_array[KEY_A]);
global.k_b_h=keyboard_check(keymap_array[KEY_B]);
global.k_b_p=keyboard_check_pressed(keymap_array[KEY_B]);
global.k_b_r=keyboard_check_released(keymap_array[KEY_B]);
global.k_c_h=keyboard_check(keymap_array[KEY_C]);
global.k_c_p=keyboard_check_pressed(keymap_array[KEY_C]);
global.k_c_r=keyboard_check_released(keymap_array[KEY_C]);

global.k_abc_h = global.k_a_h | global.k_b_h | global.k_c_h;
global.k_abc_p = global.k_a_p | global.k_b_p | global.k_c_p;
global.k_abc_r = global.k_a_r | global.k_b_r | global.k_c_r;

global.k_st_h=keyboard_check(keymap_array[KEY_START]);
global.k_st_p=keyboard_check_pressed(keymap_array[KEY_START]);
global.k_st_r=keyboard_check_released(keymap_array[KEY_START]);

framecount++; if framecount==$10000 framecount=0;	// Add 1 to level timer
if osc_active scr_osc_num_do();
scr_sync_anim();