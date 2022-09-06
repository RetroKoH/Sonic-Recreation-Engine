function scr_got_through_act(_x,_y){
		player.invinc_timer=0;
		// Shoes cleared upon hitting signpost
		instance_create_depth(_x,_y,0,obj3A_GotThroughCard);
		f_endactbonus = true;
		ringbonus = p_rings*100;
		
		// Calculate Time Bonus
		if (p_time < 3600)			timebonus=50000;	// Under 1:00
		else if (p_time < 5400)		timebonus=10000;	// Under 1:30
		else if (p_time < 7200)		timebonus=5000;		// Under 2:00
		else if (p_time < 9000)		timebonus=4000;		// Under 2:30
		else if (p_time < 10800)	timebonus=3000;		// Under 3:00
		else if (p_time < 12600)	timebonus=2000;		// Under 3:30
		else if (p_time < 14400)	timebonus=1000;		// Under 4:00
		else if (p_time < 18000)	timebonus=100;		// Under 5:00
		else timebonus = 0;
		
		// Cool Bonus is already determined
		
		// Play Music
}