/// @description Check for creating an animal
// If this explosion is from a badnik... create an animal object.
switch(routine)
{
	case 0:
	    routine++;
		var ani;
	    ani = instance_create_layer(x,y,"Instances",obj28_Animals);
		ani.subtype = irandom(6);
	    ani.pti = pti;
	break;
	case 1:
		routine++;
		audio_play_sound(sfx_BreakOpen,1,false);
	break;
}
