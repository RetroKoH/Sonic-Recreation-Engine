/// @description Newtron Routines
if fading || !active exit;

// Routine 0 - Spawn/Respawn Init
switch(routine)
{
	case 0:
		routine++;
		height=$10;
		width=8;
		col_path=0;		// Collision has two paths
		rout_2nd=0;
	break;
	case 1:
	switch(rout_2nd){
		case 0: // chk_distance
		{
			if (player.x > x)	anim_direction = -1;
			else				anim_direction = 1;
			var dist = abs(player.x-x);
			if (dist < $80) {
				if !(subtype){
					rout_2nd = 1;
					anim_ID = 1;
				}
				else{
					rout_2nd = 4;
					anim_ID = 3;
				}
			}
		}
		break;
		case 1: // type00
		{
			if (anim_frame<4){ // is Newt still "appearing"?
				if (player.x > x)	anim_direction = -1;
				else				anim_direction = 1;
			}
			else{ // if animation is finished, let's drop down
				if (anim_frame=1) {can_hit = true; can_harm = true;}
				scr_apply_speed(true);
				dist = scr_get_floor_dist(0, height, 0);
				if (dist <= 0) {
			        y+=dist;            
			        ysp=0;
					rout_2nd++;
					anim_ID=2;
					xsp = 2*-anim_direction;
			    }
			}
		}
		break;
		case 2: // matchfloor
		{
			scr_apply_speed(false);
			dist = scr_get_floor_dist(0, height, 0);
			if !(dist < -8 || dist >= $C)
				y+=dist;
			else rout_2nd++;
		}
		break;
		case 3: // speed-
			scr_apply_speed(false);
		break;
		case 4: // type01
			if (anim_frame=1) {can_hit = true; can_harm = true;}
			else if (anim_frame=2){
				if !(has_fired){
					has_fired = true;
					var shot = instance_create_layer(x+($14*-anim_direction),y-8,"Instances",obj23_Missile);
					shot.xsp = 2*-anim_direction;
					shot.ysp = 0;
				}
			}
		break;
	}
	break;
}