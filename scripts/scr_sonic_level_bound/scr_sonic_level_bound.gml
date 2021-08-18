function scr_sonic_level_bound(){
	if x<(v_limitleft2+16)  {x=floor((v_limitleft2+16)); xsp=0; gsp=0;}
	if x>(v_limitright2-16) {x=floor((v_limitright2-16)); xsp=0; gsp=0;}
	//if y>v_limitbtm2        scrKillSonic();
}