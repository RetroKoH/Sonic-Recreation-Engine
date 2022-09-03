function scr_got_through_act(){
		player.invinc_timer=0;
		// Shoes cleared upon hitting signpost
		instance_create_depth(0,0,0,obj3A_GotThroughCard);
		f_endactbonus = true;
		ringbonus = p_rings*100;
		
		// Calculate Time Bonus
		var sec = p_timeseconds;
		sec += p_timeminutes*60;

		if (sec < 60)		timebonus=50000;	// Under 1 minute
		else if (sec < 90)	timebonus=10000;	// Under 1:30
		else if (sec < 120)	timebonus=5000;		// Under 2:00
		else if (sec < 150)	timebonus=4000;		// Under 2:30
		else if (sec < 180)	timebonus=3000;		// Under 3:00
		else if (sec < 210)	timebonus=2000;		// Under 3:30
		else if (sec < 240)	timebonus=1000;		// Under 4:00
		else if (sec < 300)	timebonus=100;		// Under 5:00
		else timebonus = 0;
		
		// Cool Bonus is already determined
		
		// Play Music
}