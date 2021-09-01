/// @description Set input based on key presses.
global.k_l_h=keyboard_check(keymap_left);
global.k_l_p=keyboard_check_pressed(keymap_left);
global.k_r_h=keyboard_check(keymap_right);
global.k_r_p=keyboard_check_pressed(keymap_right);
global.k_u_h=keyboard_check(keymap_up);
global.k_u_p=keyboard_check_pressed(keymap_up);
global.k_d_h=keyboard_check(keymap_down);
global.k_d_p=keyboard_check_pressed(keymap_down);

global.k_a_h=keyboard_check(keymap_a);
global.k_a_p=keyboard_check_pressed(keymap_a);
global.k_a_r=keyboard_check_released(keymap_a);
global.k_b_h=keyboard_check(keymap_b);
global.k_b_p=keyboard_check_pressed(keymap_b);
global.k_b_r=keyboard_check_released(keymap_b);
global.k_c_h=keyboard_check(keymap_c);
global.k_c_p=keyboard_check_pressed(keymap_c);
global.k_c_r=keyboard_check_released(keymap_c);

global.k_abc_h = global.k_a_h | global.k_b_h | global.k_c_h;
global.k_abc_p = global.k_a_p | global.k_b_p | global.k_c_p;
global.k_abc_r = global.k_a_r | global.k_b_r | global.k_c_r;

global.k_st_h=keyboard_check(keymap_start);
global.k_st_p=keyboard_check_pressed(keymap_start);
global.k_st_r=keyboard_check_released(keymap_start);

if osc_active scr_osc_num_do();