function scr_player_hurt_stop(){
	scr_player_check_floor();
	if !(status&STA_INAIR)
	{
		xsp = 0;
		ysp = 0;
		gsp = 0;
		anim_ID = anim_player.walk;
		move_lock = false;
		routine--;
	}
}