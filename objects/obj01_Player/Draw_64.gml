/// @description Debug Info
/*if !debug exit;

draw_text(112,8,"SONIC   X: "+string(x)+
				"\n        Y: "+string(y)+
				"\nG SPEED: "+string(gsp)+"\nX SPEED: "+string(xsp)+"\nY SPEED: "+string(ysp)+
				"\nANGLE: "+string(angle)+"  ("+string(anim_angle)+")"+
				"\n"+string(col_tile_A)+
				"\n"+string(defaultHeight)+" "+string(height));//string(tilemap_get_x(col_tile_A))+" "+string(tilemap_get_y(col_tile_A)));

draw_text(282,8,"STATUS: "+string(status)+"  CTRL"+string(ctrl)+
				"\nFACE LEFT: "+string(status&STA_FACING)+
				"\nIN AIR: "+string((status&STA_INAIR)/STA_INAIR)+
				"\nSPINNING: "+string((status&STA_SPIN)/STA_SPIN)+
				"\nON OBJECT: "+string((status&STA_ONOBJ)/STA_ONOBJ)+
				"\nROLL JUMP: "+string((status&STA_ROLLJUMP)/STA_ROLLJUMP)+
				"\nPUSHING: "+string((status&STA_PUSH)/STA_PUSH)+
				"\nUNDERWATER: "+string((status&STA_WATER)/STA_WATER));
				
draw_text(452,8,"\nDOUBLE JUMP: "+string(double_jump_flag)+" : "+string(double_jump_property)+
				"\nSHIELD: "+string(powerups&POW_SHIELD)+" "+string(my_shield)+
				"\nINVINCIBILITY: "+string((powerups&POW_INVINC)/POW_INVINC)+": "+string(invinc_timer)+
				"\n"+string(my_stars));

// Tile Collision Points
draw_text(850,8,"COLLISION: "+string(col_path));
var _x = 855, _y = 30, scale = 2;
draw_rectangle_color(_x,_y+1,_x+(40*scale),_y+(40*scale),c_black,c_black,c_black,c_black,false);
draw_rectangle_color(_x+1,_y+2,_x+(40*scale)-1,_y+(40*scale)-1,c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia,true);

// Draw collision sensor feedback
if (anim_ID >= anim_player.idle)
{	var xx = _x+20*scale, yy = _y+20*scale;
	var wid = width*scale, hgt = height*scale;
	
    gpu_set_fog(1,$C06060,0,0);
    draw_sprite_ext(anim_sprite,floor(anim_spriteframe),xx,yy,scale*anim_direction,scale,0,c_white,1); // Sonic (Drawn in a silhouette)
    gpu_set_fog(0,$C06060,0,0);

	// Col Sensor A (Left Floor)
	draw_sprite_stretched_ext(spr_debug_line,0,xx-wid,yy,scale,hgt+scale,c_lime,1);
		draw_sprite_stretched(spr_debug_line,0,xx-wid,yy+hgt,scale,scale);

	// Col Sensor B (Right Floor)
	draw_sprite_stretched_ext(spr_debug_line,0,xx+wid,yy,scale,hgt+scale,c_teal,1);
		draw_sprite_stretched(spr_debug_line,0,xx+wid,yy+hgt,scale,scale);

	// Col Sensor C (Left Ceiling)
	draw_sprite_stretched_ext(spr_debug_line,0,xx-wid,yy-hgt,scale,hgt+scale,c_blue,1);
		draw_sprite_stretched(spr_debug_line,0,xx-wid,yy-hgt,scale,scale);

	// Col Sensor D (Right Ceiling)
	draw_sprite_stretched_ext(spr_debug_line,0,xx+wid,yy-hgt,scale,hgt+scale,c_yellow,1);
		draw_sprite_stretched(spr_debug_line,0,xx+wid,yy-hgt,scale,scale);

	var gr = !(status&STA_INAIR) && (angle < 11.25 || angle > 348.75);

	// Col Sensor E (Left Wall)
	draw_sprite_stretched_ext(spr_debug_line,0,xx-(10*scale),yy+((8*scale)*gr),10*scale,scale,c_fuchsia,1);
		draw_sprite_stretched(spr_debug_line,0,xx-(10*scale),yy+((8*scale)*gr),scale,scale);

	// Col Sensor F (Right Wall)
	draw_sprite_stretched_ext(spr_debug_line,0,xx,yy+((8*scale)*gr),10*scale,scale,c_red,1);
		draw_sprite_stretched(spr_debug_line,0,xx+(10*scale),yy+((8*scale)*gr),scale,scale);
}