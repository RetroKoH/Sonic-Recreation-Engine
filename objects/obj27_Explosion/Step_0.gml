/// @description Check for creating an animal
// If this explosion is from a badnik... create an animal object.

var ani;

if routine == 0
{
    routine = 2; 
    ani = instance_create_layer(x,y,"Instances",obj28_Animals);
	ani.subtype = irandom(6);
    ani.pti = pti;
}
