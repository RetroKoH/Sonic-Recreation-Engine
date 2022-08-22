/// @description Debug draw

if debug
{
	if collide>0
		scr_debug_draw(0,c_red);
	else
		scr_debug_draw(0,c_white);
	
	var xr = (floor(bbox_right-bbox_left) div 2)+player.width+1;	//combined_x_radius
	var yr = (floor(bbox_bottom-bbox_top) div 2)+player.height;		//combined_y_radius
	var _fx = floor(x), _fy = floor(y), _fpx = floor(player.x), _fpy = floor(player.y);

	var _xx = (_fpx - _fx) + xr;		// x_dist
		if (_fpx > _fx) _xx -= xr*2;	// negative x_dist if player is to the right
	var _yy = (_fpy - _fy) + 4 + yr;	// y_dist
		if (_fpy - _fy) _yy -= yr*2;	// negative y_dist if player is below

	draw_text(x-10,y-12,string(xr) + "--" + string(yr));
	draw_text(x-10,y,string(_xx) + ":" + string(_yy));
}
