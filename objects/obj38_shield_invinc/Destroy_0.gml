/// @description Free up the Reserved Space
scr_set_bgm(global.default_track);
player.my_stars = -1;
if player.my_shield != -1
	player.my_shield.visible = true;