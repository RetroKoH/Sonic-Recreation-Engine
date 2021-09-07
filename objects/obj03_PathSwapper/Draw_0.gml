/// @description Draw pathswapper

if debug {
	for (i = 0; i < radius div $10; i++)
	{
		draw_sprite(sprite_index,image_index,x,y+($10*i));
		draw_sprite(sprite_index,image_index,x,y-($10*(i+1)));
	}

	draw_rectangle(x-8,y-radius,x+8,y+radius,true);
	
	draw_text(x,y-14,routine);
	draw_text(x,y,swap_flag);
	draw_text(x,y+12,orientation);
	draw_text(x,y+24,radius);
	draw_text(x,y+36,flag_rightdown);
	draw_text(x,y+48,flag_leftup);
}
