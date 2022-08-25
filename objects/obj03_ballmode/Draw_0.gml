/// @description Draw Ball Mode

if debug {
	for (i = 0; i < radius div $10; i++)
	{
		draw_sprite(sprite_index,image_index,x,y+($10*i));
		draw_sprite(sprite_index,image_index,x,y-($10*(i+1)));
	}

	draw_rectangle(x-8,y-radius,x+8,y+radius,true);
}
