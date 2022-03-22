/// @description Run through routine when game is ready to begin
var lay_id = layer_get_id("Back_color");
var back_id = layer_background_get_id(lay_id);

switch(routine)
{
	case -1:
		layer_background_blend(back_id,bkg_col);
		routine++;
	break;
	case 0:
		if global.start_game
		{
			delay--;
			if !delay
				routine++;
		}
	break;
	case 1:
		if bkg_col < c_white {
			bkg_col += $111111
			layer_background_blend(back_id,bkg_col);
		}
		else {
			delay = 15;
			routine++;
		}
	break;
	case 2:
		delay--;
		if !delay {
			visible = true;
			image_speed = 1;
			delay = 10;
			routine++;
		}
	break;
	case 3:
		if !image_speed
		{
			delay--;
			if !delay
			{
				audio_play_sound(SEGA,0,false);
				delay = (audio_sound_length(SEGA)*60)+15;
				routine++;
			}
		}
		else if image_index >= image_number-1
			image_speed = 0;
	break;
	case 4:
		delay--;
		if !delay
			scr_trigger_fade(rm_title);
	break;
}