function scr_wrap_angle(ang){
	//scr_wrap_value(ang, 360); // For some reason, this doesn't work
    if (ang < 0)
        return 360 - ((-ang) % 360);
    return ang mod 360;
}

function scr_wrap_value(val, limit){
	if (val < 0)
        return limit - ((-val) % limit);
    return val mod limit;
}
