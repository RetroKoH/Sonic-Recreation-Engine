/// @description Render Sprite
draw_self();

if routine==1{
var c = c_lime;
if collide
	c = c_red;
	
	// Transparent collision box
	draw_set_alpha(.25);
	draw_rectangle_color(floor(x)-width,floor(y)-8,floor(x)+width,floor(y)+8,
	                    c,c,c,c,false);
	// Opaque collision box outline
	draw_set_alpha(1);
	draw_rectangle_color(floor(x)-width,floor(y)-8,floor(x)+width,floor(y)+8,
	                    c,c,c,c,true);
}

/*if collide==true
		scr_debug_draw(0,c_red);
	else
		scr_debug_draw(0,c_white);