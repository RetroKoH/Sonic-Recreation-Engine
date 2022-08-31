// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_touch_objBumper(){
	var obj,p,pts;
	obj = instance_place(x,y,obj47_Bumper);

	if (obj!=noone && routine < 2) // If we collide with a bumper, and are not hurt
	{
	    // Get the angle between the bumper and Sonic and then reset the x and y speeds
	    p = degtorad(round(scr_wrap_angle(point_direction(x,y,obj.x,obj.y)-180)));
	    xsp=7*cos(p); //cos(scrWrapAngle(p-gravity_angle));
	    ysp=7*-sin(p); //sin(scrWrapAngle(p-gravity_angle));
    
	    with(obj)
	    {    
	        // Now for the reaction by the bumper
	        routine++;
	        audio_play_sound(sfx_Bumper,1,false);
	        hit+=1;
	        // If the bumper has been hit 1-10 times, we can give 10 points.
	        if hit<=10
	        {
	            scr_add_points(10);
	            pts=instance_create_layer(x,y,"Instances",obj29_Points);
	            pts.image_index=0;
	        }
	    }
	}
}