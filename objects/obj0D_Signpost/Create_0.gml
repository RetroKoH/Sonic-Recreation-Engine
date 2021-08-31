/// @description Init Signpost
// This object will be vital, as it marks the end of the level.

spintime=60;        // Time for signpost to spin.
sparkletime=$B;     // Time between sparkles.
sparkleid=0;        // Counter to keep track of sparkles.
routine=0;          // This notes what we should do in the Step Event code.

// Animation system related variables
scr_initanimations(AnimationsSignpost,0);