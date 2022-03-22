function scr_give_powerup(powerup){
	routine++;
	timedelay = 19;

	switch(powerup) {
		case 0:
			scr_player_hurt();
		break;
		case 1:
			p_lives++;
		break;
		case 2:
			shoes_timer = $4B0;
		break;
		case 3:
			shield = 1;
			audio_play_sound_at(S2_2F_BlueShield,x+(x-player.x),y,0,
				global.core_sound.max_dist,global.core_sound.dropoff_dist,global.core_sound.multiplier,false,1);
		break;
		case 4:
			invinc_timer = $4B0;
		break;
		case 5:
			scr_collect_rings(10);
			audio_play_sound_at(S2_4E_Ring,x+(x-player.x),y,0,
				global.core_sound.max_dist,global.core_sound.dropoff_dist,global.core_sound.multiplier,false,1);
		break;
		case 6:
			super_flag = true;
		break;
		case 7:
		break;
	}
}