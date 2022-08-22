/// @description Handling player interaction
switch(routine)
{
	case 0: // Just being solid
	var _h = floor(bbox_bottom-bbox_top) div 2;
	collide = scr_solid_monitor(floor(bbox_right-bbox_left) div 2, _h, _h, x);
	break;

	case 1: // Being broken open (From TouchResponse)
		routine++;
		ptfm_solid = false;
		anim_ID++;
		var pw = instance_create_layer(x,y,"Instances",obj2E_PowerupIcon);
		pw.sprite_index = sprite_index;
		pw.image_index = 3+subtype;
		var ex = instance_create_layer(x,y,"Instances",obj27_Explosion);
		ex.routine = 1; // Dont create an animal
	break;
}