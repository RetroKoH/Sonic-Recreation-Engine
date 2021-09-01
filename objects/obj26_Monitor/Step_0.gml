/// @description Handling player interaction
switch(routine)
{
	//case 0: // Just being solid
	//break;
	case 1: // Being broken open (From TouchResponse)
		routine++;
		ptfm_solid = false;
		anim_ID++;
		var pw = instance_create_layer(x,y,"Instances",obj2E_PowerupIcon);
		pw.image_index = subtype;
		var ex = instance_create_layer(x,y,"Instances",obj27_Explosion);
		ex.routine = 1; // Dont create an animal
	break;
}