/// @description Draw out the selected tile
if !visible exit;

draw_rectangle_color(_X1,_Y1,_X2,_Y2,c_lime,c_lime,c_lime,c_lime,true);
draw_tile(TILESET_GHZ,tile_index,0,_X1,_Y1);

/*draw_rectangle_color((view_wport[0]/2)-64,(view_hport[0]/2)-64,(view_wport[0]/2)+64,(view_hport[0]/2)+64,
					c_white,c_white,c_white,c_white,true);
draw_tile(TILESET_GHZ,tile_index,0,(view_wport[0]/2)-64,(view_hport[0]/2)-64);
