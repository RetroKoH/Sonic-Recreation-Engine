/// @description Animation Rendering

if !((invuln_timer) && (invuln_timer % 4))
	scr_render_anim(false);

if debug{
	scr_debug_draw(0,c_blue);

	// Debug visuals
	draw_sprite(spr_debug_center,0,x,y);

	// Col Sensor A (Left Floor)
	if col_sensor_A draw_sprite_stretched_ext(spr_debug_line,0,x-width,y,1,height+1,c_lime,1);
	else			draw_sprite_stretched_ext(spr_debug_line,0,x-width,y,1,height+1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x-width,y+height);
	
	draw_text(x-width-8,y+height+4,real_hgt_l);

//	var tx=tilemap_get_cell_x_at_pixel(map_id,x-width,y+height)*TILE_SIZE, ty=tilemap_get_cell_y_at_pixel(map_id,x-width,y+height)*TILE_SIZE;
//	draw_rectangle_color(tx,ty,tx+TILE_SIZE,ty+TILE_SIZE,c_white,c_white,c_white,c_white,false);

	// Col Sensor B (Right Floor)
	if col_sensor_B draw_sprite_stretched_ext(spr_debug_line,0,x+width,y,1,height+1,c_lime,1);
	else			draw_sprite_stretched_ext(spr_debug_line,0,x+width,y,1,height+1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x+width,y+height);
	
	draw_text(x+width+8,y+height+4,real_hgt_r);

	// Col Sensor C (Left Ceiling)
	draw_sprite_stretched_ext(spr_debug_line,0,x-width,y-height,1,height+1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x-width,y-height);

	// Col Sensor D (Right Ceiling)
	draw_sprite_stretched_ext(spr_debug_line,0,x+width,y-height,1,height+1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x+width,y-height);

	var gr = !(status&2) && angle==0;

	// Col Sensor E (Left Wall)
	if col_sensor_E draw_sprite_stretched_ext(spr_debug_line,0,x-10,y+(8*gr),10,1,c_lime,1);
	else			draw_sprite_stretched_ext(spr_debug_line,0,x-10,y+(8*gr),10,1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x-10,y+(8*gr));

	// Col Sensor F (Right Wall)
	if col_sensor_F draw_sprite_stretched_ext(spr_debug_line,0,x,y+(8*gr),10,1,c_lime,1);
	else			draw_sprite_stretched_ext(spr_debug_line,0,x,y+(8*gr),10,1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x+10,y+(8*gr));

	// Movement angle line
	draw_sprite(spr_debug_line_rotate,move_angle,x,y);
	draw_text(x-3,y-8,string(floor(scr_wrap_angle((move_angle + ((move_angle >= 180) ? 1.40625 : 0)) + 43.59375) / 90)) )
}