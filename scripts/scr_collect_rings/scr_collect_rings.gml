function scr_collect_rings(rings){
	p_rings=min(p_rings+rings,999);		// Add to rings, up to 999.
	//sound_play(sndB5_Ring);             // Play ring sound.

	if ((p_rings>=100 && p_ringlife==0) || (p_rings>=200 && p_ringlife==1))
	{
		p_lives=min(p_lives+1,999); // Add 1 life, as long as it doesn't go over 999.
		p_ringlife+=1;              // Add to the counter. Once it hits 2, no more lives for rings.
		// Play extra life jingle
	}
}