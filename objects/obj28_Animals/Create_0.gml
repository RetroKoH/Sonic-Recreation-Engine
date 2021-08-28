/// @description Init animals from badniks
// The animal that breaks out of the badnik. This object is suprisingly complex.
// It starts with jumping out and leaping away to the left. It also is responsible for creating points objects.

routine = 0;
subtype = 0;
width = 4;
height = 12;
xsp = 0;
ysp = 0;
mov_xsp = 0;
mov_ysp = 0;
frame_time = 1;
image_speed=0;                         // We don't want an animation right away, so this is 0.
depth = 6;