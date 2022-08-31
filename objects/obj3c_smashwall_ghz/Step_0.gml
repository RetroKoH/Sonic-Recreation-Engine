/// @description Insert description here
// You can write your code in this editor

switch(routine){
	case 0:
		routine++;
		subtype = image_index;	
	break;
	case 1:
		//Collision with Sonic
		var sp = player.xsp;
		var collide = scr_solid_obj($10, $20, $20, prev_x);
		if (collide){
			if ((player.object_index == obj01_Knuckles) || 
			(player.object_index == obj01_Sonic && player.powerups&POW_FLAME && player.double_jump_flag) ||
			(player.anim_ID == anim_player.roll && abs(sp) >= 4.5)){
				player.status&=~STA_PUSH;
				player.xsp = sp;
				player.x+=sp; //if (player.x<x) player.x+=sp; else player.x-=sp;
				player.gsp = player.xsp;
				scr_obj_smash(8,sign(sp));
			}
		}
	break;
	case 2:
		scr_apply_speed(false);
		ysp += grav;
	break;
}