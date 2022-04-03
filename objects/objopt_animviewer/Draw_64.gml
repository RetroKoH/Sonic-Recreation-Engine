/// @description Draw out the selected animation
if !visible exit;

draw_sprite_ext(anim_sprite,anim_spriteframe,view_wport[0]/2,view_hport[0]/2,4,4,0,c_white,1);

draw_text(0,view_hport[0]/2,"Enabled: "+string(enabled)+"\n"+
							"Anim Set: "+string(anim_set)+"/"+string(total-1)+"\n"+
							"Anim Index: "+string(anim_index)+"/"+string(max_index-1)+"\n");