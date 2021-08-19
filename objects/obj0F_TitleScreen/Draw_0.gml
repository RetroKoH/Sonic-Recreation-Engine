/// @description Draw proper animation frame

draw_sprite_ext(anim_sprite, floor(anim_spriteframe), x, y,
				anim_direction*anim_xscale, anim_yscale, 0,
				image_blend, image_alpha);

if (PSB_visible) draw_sprite(spr_PSB,0,room_width/2 - 8,y+176-112);