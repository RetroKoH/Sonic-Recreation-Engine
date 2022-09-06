/// @description Present Points
if ysp<0 // If the object is moving,
{
    y+=ysp;     // Move the object upwards with ysp.
    ysp+=.09375; // Reduce the speed by $0018/256.
}
else     // If not... perform the new fade out effect.
{
    if image_alpha>0 image_alpha-=.1;
	else instance_destroy();
}
