// Update gsp based on directional input and apply friction/deceleration.
function scr_player_move() {
	var move=(global.k_r_h - global.k_l_h);	// Movement based on key control.

	// Movement
	if !move_lock
	{
	    // Set horizontal speed based on input. Weight affects movement speed.
		if move == -1 // Moving left
		{
			if (gsp>0)  // If moving right?
			{
				gsp-=decel_run;							// Decelerate if moving right.
				if (angle>315 || angle<45) && gsp>=4	// If character is on Floor angles, and GSP is at/above 4, skid.
				{
					if anim_ID!=anim_player.skid anim_ID=anim_player.skid;	// {anim_ID=anim_player.skid; sound_play(sndA4_Skid);}
					status&=~STA_FACING;									// Clear Facing status bit
				}
			}
			else // If already moving left or not moving
			{
				if !(status&STA_FACING)	// If not facing Left
				{
					status|=STA_FACING;	// Face left, setting Facing bit
					status&=~STA_PUSH;	// Clear Pushing status bit
					// Run animation set to run next.
				}
				if (gsp>=-topspeed)   // If the character is moving slower than max speed to the left...
				{
					gsp-=accel_run;					// Accelerate to the left. Weight affects movement speed.
					anim_ID=anim_player.walk;		// Enter running animation.
					if gsp<-topspeed gsp=-topspeed;	// ONLY IF the character was moving slower than max speed, set speed to max if it exceeds max.
				}
			}
		}
		else if move == 1 // Moving right
		{
			if (gsp<0)
			{
				gsp+=decel_run;							// Decelerate if moving left.
				if (angle>315 || angle<45) && gsp<=-4	// If character is on Floor angles, and GSP is at/above 4, skid.
				{
					if anim_ID!=anim_player.skid anim_ID=anim_player.skid;	//{anim_ID=anim_player.skid; sound_play(sndA4_Skid);}
					status|=STA_FACING;										// Set facing bit
				}
			}
			else	// If already moving right or not moving
			{
				if (status&STA_FACING)	// If not facing Right
				{
				    status^=STA_FACING;	// Face right, clearing Facing bit
				    status&=~STA_PUSH;	// Clear Pushing status bit
				    // Run animation set to run next.
				}
				if gsp<=topspeed // If the character is moving slower than max speed to the right
				{
				    gsp+=accel_run;					// Accelerate to the right.
				    anim_ID=anim_player.walk;		// Enter running animation.
				    if gsp>topspeed gsp=topspeed;	// ONLY IF the character was moving slower than max speed, set speed to max if it exceeds max.
				}
			}
		}
		else if ((angle>315 || angle<45) && gsp == 0) // If Sonic is on Floor angles, and not moving
		{
			status&=~STA_PUSH;	// Clear Pushing status bit
			anim_ID=anim_player.idle;

			// Looking up and down
			if global.k_u_h
			{
				anim_ID=anim_player.lookup;
				v_lookshift+=2;
			}
			else if global.k_d_h
			{
				anim_ID=anim_player.duck;
				v_lookshift-=2;
			}
		}
	}
	// Reset screen
	if v_lookshift>$60      v_lookshift-=2; // If we were looking up, bring look shift back down.
	else if v_lookshift<$60 v_lookshift+=2; // If we were looking down, bring look shift back up.

	// Friction
	if (move == 0) gsp-=min(abs(gsp),accel_run)*sign(gsp);	// Friction formula according to Sonic Retro Physics Guide.

	// Apply to x and y speeds using the acquired gsp.
	xsp = gsp*cos(degtorad(angle));
	ysp = gsp*-sin(degtorad(angle));
}