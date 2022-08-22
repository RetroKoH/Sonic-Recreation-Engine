function scr_player_display(){
	if (invuln_timer) invuln_timer--;
	
	if (powerups&POW_INVINC) {
		invinc_timer--;
		if !(invinc_timer) {
			// Restore level music
			powerups&=~POW_INVINC;	// Destruction of the object happens in the object itself.
		}
	}
	if (powerups&POW_SHOES) {
		shoes_timer--;
		if !shoes_timer{
			// Restore level music
			powerups&=~POW_SHOES;
		}
	}
}