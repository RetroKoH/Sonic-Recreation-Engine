function scr_tails_startflight(){
	if !double_jump_flag {
		if global.k_abc_p {
			status&=~STA_SPIN;				// No longer in a ball
			status&=~STA_ROLLJUMP;
			height=defaultHeight;
			width=WIDTH_MAIN;
			y--;							// Adjust y-pos slightly
			double_jump_flag=1;				// We are now flying
			double_jump_property=480;		// Flight lasts for 480 frames
			scr_tails_set_flight_anim();
		}
	}
}
function scr_tails_set_flight_anim(){
	var ani;
	if !(status&STA_WATER){
		var snd;
		ani = anim_player.fly;
		snd = sfxS3KBB_TailsFly;
		if !double_jump_property{
			ani = anim_player.fly_tired;
			snd = sfxS3KBA_TailsTired;
		}
		else if abs(xsp) >= 4.5 && sign(xsp)==anim_direction
			ani = anim_player.fly_fast;
		
		anim_ID = ani;
		if !framecount&$F audio_play_sound(snd,1,false);
	}
	else{
		ani = anim_player.swim;
		if ysp <= 0 ani = anim_player.swim_up;
		if !double_jump_property ani = anim_player.fly_tired;
		anim_ID = ani;
	}
}