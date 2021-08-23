/// @description Animation Rendering

scr_render_anim(false);

if debug{
	scr_debug_draw(0,c_blue);
	
	
	// Debug visuals
	draw_sprite(spr_debug_center,0,x,y);

	// Col Sensor A (Left Floor)
	if col_sensor_A draw_sprite_stretched_ext(spr_debug_line,0,x-width,y,1,height+1,c_lime,1);
	else			draw_sprite_stretched_ext(spr_debug_line,0,x-width,y,1,height+1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x-width,y+height);

	// Col Sensor B (Right Floor)
	if col_sensor_B draw_sprite_stretched_ext(spr_debug_line,0,x+width,y,1,height+1,c_lime,1);
	else			draw_sprite_stretched_ext(spr_debug_line,0,x+width,y,1,height+1,c_fuchsia,1);
		draw_sprite(spr_debug_line,0,x+width,y+height);

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
}