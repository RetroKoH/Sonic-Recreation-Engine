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
		audio_play_sound_at(S2_41_BreakOpen,x+(4*(x-player.x)),y,0,
			global.core_sound.max_dist,global.core_sound.dropoff_dist,global.core_sound.multiplier,false,1);
	break;
}
