/// @description Present Points
// This tells the object to move upwards with ysp. While it is moving upwards, ysp decreases.
// If the object is NOT moving, it fades out and deletes itself. AGAIN, it is not the object that increases SCORE.

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
