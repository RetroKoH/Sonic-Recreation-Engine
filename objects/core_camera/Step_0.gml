/// @description Set soft limit to the hard limit

if v_limitleft1 != v_limitleft2
	v_limitleft1 = v_limitleft2;

if v_limitright1 != v_limitright2
	v_limitright1 = v_limitright2;

if v_limitbtm1 < v_limitbtm2
	v_limitbtm1 = clamp(v_limitbtm1+2,v_limitbtm1,v_limitbtm2);

else if v_limitbtm1 > v_limitbtm2
	v_limitbtm1 = clamp(v_limitbtm1-2,v_limitbtm2,v_limitbtm1);