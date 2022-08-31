function scr_touch_objRoutine(){
	// When collecting a ring, the ring enters its collected routine.
	var ob = instance_place(x,y,objParent_Routine);
	if (ob!=noone) // If we collide with a ring, and are not hurt
	{if ob.routine==1 ob.routine++;}
}