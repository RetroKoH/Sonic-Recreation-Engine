/// @description Draw out debug log
if debug{
	if (target_ID != -1)
	{
		if instance_exists(target_ID)
		{
			DEBUG_DATA(target_ID,target_Index,target_Label);
		}
		else
		{
			draw_text(362,8,"Object despawned");
		}
	}
	
	draw_set_alpha(0.5)
	draw_rectangle_color(0,view_hport[0]-string_height("\n\n\n")-4,view_wport[0],view_hport[0],c_black,c_black,c_black,c_black,false);
	draw_text_color(4,view_hport[0]-string_height(debuglog),debuglog,c_aqua,c_aqua,c_aqua,c_aqua,1);
	draw_set_alpha(1)
}