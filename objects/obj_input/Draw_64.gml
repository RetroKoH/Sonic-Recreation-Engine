/// @description Debug Info
if debug{
	var ay=40;

	draw_rectangle(21,ay+8,31,ay+18,global.k_u_h=false);
	draw_rectangle(06,ay+20,16,ay+30,global.k_l_h=false);
	draw_rectangle(36,ay+20,46,ay+30,global.k_r_h=false);
	draw_rectangle(21,ay+32,31,ay+42,global.k_d_h=false);

	draw_circle(60,ay+24,6,global.k_a_h=false);
	draw_circle(74,ay+22,6,global.k_b_h=false);
	draw_circle(88,ay+20,6,global.k_c_h=false);

	draw_roundrect(70,ay-2,88,ay+6,global.k_st_h=false);
	
	draw_text(20, ay+100, chunks_count);
}