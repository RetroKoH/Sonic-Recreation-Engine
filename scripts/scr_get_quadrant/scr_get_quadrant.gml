function scr_get_quadrant(ang){
	return floor(scr_wrap_angle((ang + ((ang >= 180) ? 1.40625 : 0)) + 43.59375) / 90);
}