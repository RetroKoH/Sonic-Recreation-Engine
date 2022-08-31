/// @description Render Walls
if (routine==1)
{
	draw_self();
	event_inherited();
}
else if (routine==2)
{
	draw_sprite_part(sprite_index,image_index,8*(piece mod 2),8*(piece div 2),8,8,x,y);
}