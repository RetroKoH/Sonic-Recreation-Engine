	// Subroutine enabling the player to jump.
function scr_player_jump(){
	var jump_flag = (scr_player_get_ceiling_dist(0)<6); // Cant jump if a ceiling is less than 6px above you
	if global.k_abc_p
	{
	    var jmp = jmp_spd;
		if (status&STA_WATER) jmp -= 3;	// Alter gravity depending on underwater status bit 
	    if !jump_flag					// Check ceiling collision with a line.
	    {
	        xsp-=jmp*sin(degtorad(angle));
	        ysp-=jmp*cos(degtorad(angle));
	        status|=STA_INAIR;							// Set Air status bit
	        status&=~STA_PUSH;							// Clear Pushing status bit
			ctrl = 0;									// Skip the rest of the Normal Mode Routine
			if (status&STA_ONOBJ) status^=STA_ONOBJ;	// Clear On Obj status bit
	        jump=true;
	        convex=false;
	        move_lock=false;
	        audio_play_sound_at(sfx_Jump,x+(20*xsp),y+18,0,
				global.core_sound.max_dist,global.core_sound.dropoff_dist,global.core_sound.multiplier,false,1);
	        if (status&STA_SPIN) status|=STA_ROLLJUMP; // Set Rolling Jump bit if necessary.
	        else
	        {
	            height=HEIGHT_ROLL;
	            width=WIDTH_ROLL;
	            anim_ID=anim_player.roll;
	            status|=STA_SPIN;				// Set Rolling bit
	            y+=defaultHeight-height;		// Reposition according to height change
	        }
	    }
	}
}