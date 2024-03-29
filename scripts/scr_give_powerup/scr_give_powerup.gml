function scr_give_powerup(powerup){
	routine++;
	timedelay = 19;

	switch(powerup) {
		case MON_EGGMAN:
			with(player) scr_player_hurt(self);
		break;
		case MON_SPEEDSHOES:
			player.shoes_timer = $4B0;
			player.powerups|=POW_SHOES;
			with(player) scr_player_set_speeds();
		break;
		case MON_SHIELD:
			player.powerups&=POW_RMVSHIELDS;	// Clear shield flags
			player.powerups|=POW_SHIELD;		// Set blue shield flag
			if player.my_shield!=-1 instance_destroy(player.my_shield);
			player.my_shield = instance_create_layer(player.x,player.y,"Instances",obj38_Shield_Blue);
			audio_play_sound(sfx_ShieldBlue,1,false);
		break;
		case MON_INVINC:
			if !player.super {
				player.invinc_timer = $4B0;
				player.powerups|=POW_INVINC;
				if player.my_stars!=-1 instance_destroy(player.my_stars);
				player.my_stars = instance_create_layer(player.x,player.y,"Instances",obj38_Shield_Invinc);
				// Add 3 more trailing objects
				scr_set_bgm(BGM_tracks.Invinc);
			}
		break;
		case MON_RINGS:
			scr_collect_rings(10);
			audio_play_sound(sfx_RingBox,1,false);
		break;
		case MON_SUPER:
			player.super = true;
		break;
		case MON_SHIELD_F:
			player.powerups&=POW_RMVSHIELDS;	// Clear shield flags
			player.powerups|=POW_SHIELD;		// Set shield flag
			player.powerups|=POW_FLAME;			// Set flame shield flag
			if player.my_shield!=-1 instance_destroy(player.my_shield);
			player.my_shield = instance_create_layer(player.x,player.y,"Instances",obj38_Shield_Flame);
			audio_play_sound(sfx_ShieldFlame,1,false);
		break;
		case MON_SHIELD_B:
			player.powerups&=POW_RMVSHIELDS;	// Clear shield flags
			player.powerups|=POW_SHIELD;		// Set shield flag
			player.powerups|=POW_BUBBLE;		// Set bubble shield flag
			if player.my_shield!=-1 instance_destroy(player.my_shield);
			player.my_shield = instance_create_layer(player.x,player.y,"Instances",obj38_Shield_Bubble);
			audio_play_sound(sfx_ShieldBubble,1,false);
		break;
		case MON_SHIELD_L:
			player.powerups&=POW_RMVSHIELDS;	// Clear shield flags
			player.powerups|=POW_SHIELD;		// Set shield flag
			player.powerups|=POW_LIGHTNING;		// Set lightning shield flag
			if player.my_shield!=-1 instance_destroy(player.my_shield);
			player.my_shield = instance_create_layer(player.x,player.y,"Instances",obj38_Shield_Lightning);
			audio_play_sound(sfx_ShieldLightning,1,false);
		break;
		case MON_GOGGLES:
		case MON_CLOCK: // Used in the new Bonus Stage
		break;
		case MON_EXTRALIFE:
		default:
			p_lives++;
			scr_play_1up();		// play 1-Up
		break;
	}
}