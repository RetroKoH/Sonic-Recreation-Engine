/// @description Init animals from badniks
// The animal that breaks out of the badnik. This object is suprisingly complex.
// It starts with jumping out and leaping away to the left. It also is responsible for creating points objects.

routine=0
image_speed=0;                         // We don't want an animation right away, so this is 0.
ysp=-4;                                // The speed that the object will move at. This will decrease over time.
