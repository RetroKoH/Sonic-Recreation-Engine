function scr_add_points(pts){
	// Subroutine to add points
	p_score=min(p_score+pts,9999999); // Set to the correct score, or the max: 9,999,999.

	if p_score>=p_scorelife
	{
	    p_scorelife+=50000;
	    p_lives=min(p_lives+1,999); // Add 1 life, as long as it doesn't go over 999.
	    // Play extra life jingle
	}
}