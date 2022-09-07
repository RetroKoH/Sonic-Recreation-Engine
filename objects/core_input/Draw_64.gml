/// @description Debug Info
if debug{
	var ax=10, ay=96;
	draw_text(ax,ay-20,"Input");
	draw_rectangle(ax+15,ay+8,ax+25,ay+18,global.k_u_h=false);
	draw_rectangle(ax,ay+20,ax+10,ay+30,global.k_l_h=false);
	draw_rectangle(ax+30,ay+20,ax+40,ay+30,global.k_r_h=false);
	draw_rectangle(ax+15,ay+32,ax+25,ay+42,global.k_d_h=false);

	draw_circle(ax+54,ay+24,6,global.k_a_h=false);
	draw_circle(ax+68,ay+22,6,global.k_b_h=false);
	draw_circle(ax+82,ay+20,6,global.k_c_h=false);

	draw_roundrect(ax+64,ay-2,ax+82,ay+6,global.k_st_h=false);
}