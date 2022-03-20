// Adjust Ground Speed based on current angle
function scr_player_slope_resist(rolling){
	var a = sin(degtorad(angle));

	if rolling
		gsp -= (sign(gsp)==sign(a)) ? .078125*a : .3125*a;	// Rolling

	/*	gsp-=.078125*a;	// if rolling uphill
		gsp-=.3125*a;	// if rolling downhill*/
	
	else
		if gsp!=0 gsp-=(.125*a);	// Standard
}