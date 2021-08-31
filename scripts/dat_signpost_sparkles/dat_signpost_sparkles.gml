function dat_signpost_sparkles(){
	// Data Structure for locations of ring sparkles. Each value is added to signpost's
	// position, and a ring object is created, in its sparkle routine.
	globalvar sparkpos;
	sparkpos[0,0]=-$18; sparkpos[0,1]=-$10;
	sparkpos[1,0]=8;    sparkpos[1,1]=8;
	sparkpos[2,0]=-$10; sparkpos[2,1]=0;
	sparkpos[3,0]=$18;  sparkpos[3,1]=-8;
	sparkpos[4,0]=0;    sparkpos[4,1]=-8;
	sparkpos[5,0]=$10;  sparkpos[5,1]=0;
	sparkpos[6,0]=-$18; sparkpos[6,1]=8;
	sparkpos[7,0]=$18;  sparkpos[7,1]=$10;
}