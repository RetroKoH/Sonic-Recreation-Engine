// Animated sprites for GHZ tiles
// Used in the actual levels for all chunks
function scr_aniart_GHZ(tile_ID,_x,_y){ 
	switch(tile_ID) {
		case 1:
		{
			layer_sprite_create(spr_id,_x,_y+48,aniart_GHZFlower_1);
			layer_sprite_create(spr_id,_x+64,_y+64,aniart_GHZFlower_2);
			layer_sprite_create(spr_id,_x+96,_y+64,aniart_GHZFlower_1);
		}
		break;
		case 2:
		{
			layer_sprite_create(spr_id,_x+32,_y+64,aniart_GHZFlower_2);
			layer_sprite_create(spr_id,_x+80,_y+64,aniart_GHZFlower_2);
		}
		break;
		case 9:
		{
			layer_sprite_create(spr_id,_x+96,_y+32,aniart_GHZFlower_1);
		}
		break;
		case 11:
		case 27:
		case 178:
		case 182:
		{
			layer_sprite_create(spr_id,_x,_y-16,aniart_GHZFlower_1);
		}
		break;
		case 13:
		{
			layer_sprite_create(spr_id,_x+32,_y+64,aniart_GHZFlower_2);
		}
		break;
		case 14:
		{
			layer_sprite_create(spr_id,_x+16,_y+32,aniart_GHZFlower_1);
		}
		break;
		case 58:
		{
			layer_sprite_create(spr_id,_x+32,_y+64,aniart_GHZFlower_2);
			layer_sprite_create(spr_id,_x+64,_y+64,aniart_GHZFlower_2);
		}
		break;
		case 59:
		{
			layer_sprite_create(spr_id,_x,_y+64,aniart_GHZFlower_1);
			layer_sprite_create(spr_id,_x+32,_y+64,aniart_GHZFlower_2);
		}
		break;
		case 70:
		{
			layer_sprite_create(spr_id,_x+96,_y+64,aniart_GHZFlower_1);
		}
		break;
		case 74:
		{
			layer_sprite_create(spr_id,_x+64,_y+64,aniart_GHZFlower_2);
			layer_sprite_create(spr_id,_x+96,_y+48,aniart_GHZFlower_1);
		}
		break;
		case 82:
		{
			layer_sprite_create(spr_id,_x+64,_y+64,aniart_GHZFlower_1);
			layer_sprite_create(spr_id,_x+96,_y+48,aniart_GHZFlower_1);
		}
		break;
		case 104:
		{
			layer_sprite_create(spr_id,_x,_y+64,aniart_GHZFlower_1);
		}
		break;
		case 105:
		{
			layer_sprite_create(spr_id,_x+80,_y,aniart_GHZFlower_2);
		}
		break;
		case 130:
		{
			layer_sprite_create(spr_id,_x,_y,aniart_GHZFlower_1);
			layer_sprite_create(spr_id,_x+48,_y,aniart_GHZFlower_2);
		}
		break;
		case 136:
		{
			layer_sprite_create(spr_id,_x+64,_y+64,aniart_GHZFlower_2);
		}
		break;
		case 139:
		{
			layer_sprite_create(spr_id,_x+80,_y,aniart_GHZFlower_2);
		}
		break;
		case 142:
		{
			layer_sprite_create(spr_id,_x+16,_y-32,aniart_GHZFlower_1);
		}
		break;
		case 144:
		{
			layer_sprite_create(spr_id,_x,_y+48,aniart_GHZFlower_1);
		}
		break;
		case 167:
		{
			layer_sprite_create(spr_id,_x,_y-16,aniart_GHZFlower_1);
			layer_sprite_create(spr_id,_x+64,_y,aniart_GHZFlower_2);
			layer_sprite_create(spr_id,_x+96,_y,aniart_GHZFlower_2);
		}
		break;
		
		default:
		break;
	}
}
