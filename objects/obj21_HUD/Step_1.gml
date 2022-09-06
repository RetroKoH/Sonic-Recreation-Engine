/// @description Handle HUD blinking
if instance_exists(cam){
	x=cam.viewX;
	y=cam.viewY;
}
if (framecount%8 == 0) blink^=true;

// Calculate HUD digits
HUD_cent	= centiseconds[p_time mod 60];
HUD_sec		= (p_time div 60) mod 60;
HUD_min		= (p_time div 3600);