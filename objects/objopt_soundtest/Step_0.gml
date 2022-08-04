/// @description Animation Viewing
if !enabled exit;

if global.k_l_p {
	track_index--;
	if (track_index == -1) track_index = max_index-1;
}
if global.k_r_p {
	track_index++;
	if (track_index == max_index) track_index = 0;
}

if keyboard_check_pressed(vk_escape) {
	active = false;
	enabled = false;
}

if global.k_st_p {
	scr_set_bgm(track_index);
}
