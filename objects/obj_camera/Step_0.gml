/// @description Set soft limit to the hard limit

if v_limitbtm1 < v_limitbtm2
	v_limitbtm1 = clamp(v_limitbtm1+2,v_limitbtm1,v_limitbtm2);

else if v_limitbtm1 > v_limitbtm2
	v_limitbtm1 = clamp(v_limitbtm1-2,v_limitbtm2,v_limitbtm1);