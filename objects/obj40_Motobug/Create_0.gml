/// @description Init Motobug
xsp=0;         // The motobug's x speed
ysp=0;          // The motobug's y speed
height=$E;
width=8;
angle=0;
routine=0;      // Action routine counter.
routine_2nd=0;	// Secondary routine counter.
time=0;         // Timer delay to start moving.
smokedelay=0;   // Timer delay until motobug lets out a puff of smoke.
turntime=180;   // Temporary turn around time

// Animation system related variables
scr_initanimations(AnimationsMotobug,0);