// Reset angle towards 0 in mid-air [New subroutine more in line with Sonic 1's (From SoniC port)]
function scr_player_jump_angle(ang){
	if ang == 0	exit;
	
	if (ang < 180)
		ang = max(ang-4,0);
	else
		ang = scr_wrap_angle(min(ang+4,360));
	
	angle = ang; // Set Angle
}