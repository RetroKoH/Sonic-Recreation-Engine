function scr_wrap_angle(ang){
    if (ang < 0)
        return 360 - ((-ang) mod 360);
    return ang mod 360;
}