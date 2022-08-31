function scr_obj_smash(frag_count,dir=1){
	var obj,sp;
	for (var i=0; i<frag_count; i++){
		obj = instance_create_layer(x,y,"Instances",object_index);
		obj.ptfm_solid=false;
		obj.routine=2;
		obj.image_index = image_index;
		obj.piece=i;
		sp = fragspeed[i];
		obj.xsp = sp[0]*dir; obj.ysp = sp[1]*dir;
		with(obj) scr_apply_speed(false);
		obj.ysp += grav;
	}
	if audio_is_playing(sfx_WallSmash) audio_stop_sound(sfx_WallSmash);
	audio_play_sound(sfx_WallSmash,1,false);
	instance_destroy();
}