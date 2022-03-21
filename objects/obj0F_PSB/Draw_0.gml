/// @description Draw PSB, or the menu
if !menu draw_self();

else
{
	draw_sprite(sprite_index,1,x,y);
	draw_sprite(sprite_index,2,x,y+(sprite_height+8));
	if !option draw_sprite(sprite_index,3,x,y);
	else draw_sprite(sprite_index,3,x,y+(sprite_height+8));
}