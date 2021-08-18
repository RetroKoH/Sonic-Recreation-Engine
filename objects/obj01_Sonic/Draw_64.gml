/// @description Debug info on Sonic

// Basic status info
draw_text(112,8,"SONIC   X: "+string(x)+
				"\n        Y: "+string(y)+
				"\nG SPEED: "+string(gsp)+"\nX SPEED: "+string(xsp)+"\nY SPEED: "+string(ysp)+
				"\nSTATUS: "+string(status)+
				" --- "+string(real(status&1))+string(real(status&2)/2)+string(real(status&4)/4)+
				string(real(status&8)/4)+string(real(status&$10)/$10)+string(real(status&$20)/$20)+
				string(real(status&$40)/$40)+string(real(status&$80)/$80)
				+"\nANGLE: "+string(angle));

// Tile Collision Points
draw_text(800,8,"COLLISION FEEDBACK");
var _x = 805, _y = 30, scale = 2;
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

	var gr = !(status&2);

	// Col Sensor E (Left Wall)
	draw_sprite_stretched_ext(spr_debug_line,0,xx-(10*scale),yy+((8*scale)*gr),10*scale,scale,c_fuchsia,1);
		draw_sprite_stretched(spr_debug_line,0,xx-(10*scale),yy+((8*scale)*gr),scale,scale);

	// Col Sensor F (Right Wall)
	draw_sprite_stretched_ext(spr_debug_line,0,xx,yy+((8*scale)*gr),10*scale,scale,c_red,1);
		draw_sprite_stretched(spr_debug_line,0,xx+(10*scale),yy+((8*scale)*gr),scale,scale);
}