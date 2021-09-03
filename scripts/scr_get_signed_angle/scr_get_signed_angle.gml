function scr_get_signed_angle(ang){
	ang = scr_wrap_angle(ang);
	if (ang < 180)
		return ang;
	return ang - 360;
}