/// @description Draw out the collision tile
if !visible exit;
draw_rectangle_color(200,200,329,329,c_white,c_white,c_white,c_white,true);
draw_surface_ext(surface_tile,201,201,8,8,0,c_white,1);

draw_text(0,view_hport[0]/2,"Enabled: "+string(enabled)+"\n"+
							"Tile Index: "+string(index)+"/"+string(255)+"\n");
