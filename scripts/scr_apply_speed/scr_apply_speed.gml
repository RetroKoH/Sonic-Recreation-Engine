// Subroutine that appliss speed to position
function scr_apply_speed(grav){
	x+=xsp;
	ysp += (grav) ? .21875 : 0; // Sometimes, need to apply gravity
	y+=ysp;
}