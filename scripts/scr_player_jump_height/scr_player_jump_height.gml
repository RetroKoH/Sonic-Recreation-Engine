// Check for jump button release (variable jump velocity).
function scr_player_jump_height(){
	if jump {
		var jmp = (status&STA_WATER) ? -2 : -4;	// Underwater check
		
		// If possible, execute double jump ability 
		if (ysp > jmp) && (double_jump != -1)
			script_execute(double_jump);
		
		if !(global.k_abc_h)
			if ysp<0
				if (ysp<jmp) then ysp=jmp; // Curb jump height if button(s) not held.
	}
	else if ysp<-15.75 ysp=-15.75; // Cap upward mobility when NOT jumping.
}