/// @description Display Smoke
// These puff out of Motobug's exhaust pipe and disappear.

if image_index==2
{
    image_speed=0;
    image_alpha-=.1;
}
if image_alpha==0 instance_destroy(); // Fade out and disappear.
