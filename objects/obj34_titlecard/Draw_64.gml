/// @description Draw out the Title Card
// {Zone name}, {ZONE}, {act#}, {Blue Oval}

draw_text(2,2,"NAME: "+string(xpos[0])+"/"+string(start_x[0])+"/"+string(main_x[0]));
draw_text(2,14,"ZONE: "+string(xpos[1])+"/"+string(start_x[1])+"/"+string(main_x[1]));
draw_text(2,26,"ACT: "+string(xpos[2])+"/"+string(start_x[2])+"/"+string(main_x[2]));
draw_text(2,38,"OVAL: "+string(xpos[3])+"/"+string(start_x[3])+"/"+string(main_x[3]));

draw_sprite_ext(spr_titleoval,0,xpos[3],ypos[3],3,3,0,c_white,1);
if (act_flag) draw_sprite_ext(spr_titleacts,act_num,xpos[2],ypos[2],3,3,0,c_white,1);
draw_surface_ext(surf_zone,xpos[1],ypos[1],3,3,0,c_white,1);
draw_surface_ext(surf_name,xpos[0],ypos[0],3,3,0,c_white,1);