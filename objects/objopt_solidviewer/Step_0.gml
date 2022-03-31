if !enabled exit;
/// @description Scroll through tiles
if (global.k_u_p)
{
	if index == 0  index = 255;
	else index--;
	scr_debug_draw_tile(index);
}

if (global.k_d_p)
{
	if index == 255  index = 0;
	else index++;
	scr_debug_draw_tile(index);
}