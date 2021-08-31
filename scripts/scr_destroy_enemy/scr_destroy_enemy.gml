function scr_destroy_enemy(){
	// Subroutine to set off a chain of events occurring when destroying a badnik.

	var d0,xp;

	d0=itembonus;   // The current item bonus is saved for use now.
	itembonus+=1;   // Add to item bonus for next time.
	if d0>3 d0=3;   // Keep this at 3 or below.
	pti=d0;         // move this d0 value into the badniks code. The animal will use this to set image_index of the points.
	switch(d0)
	{
	    case 0: d0=100;  break;
	    case 1: d0=200;  break;
	    case 2: d0=500;  break;
	    case 3: d0=1000; break;
	}
	if itembonus>=16
	{
	    d0=10000; // Your new score bonus.
	    pti=4;    // move 4 into the badniks code. The animal will use this to set image_index of the points.
	}

	scr_add_points(d0); // Add this value to your score.
	instance_change(obj27_Explosion,true);	// Change into the explosion object.
	routine=0;								// Tell the explosion object to create an animal.
}