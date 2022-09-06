/// @description Level Select Controls

var scroll_v = global.k_d_h - global.k_u_h;
var scroll_h = global.k_r_h - global.k_l_h;

switch(scroll_v)
{
	case -1:
		sel_timer--;
		if !sel_timer
		{
		
			if sel_cursor == LevSel_items.GHZ1
				sel_cursor = LevSel_items.Char
			else
				sel_cursor--;
			sel_timer = sel_delay;
		}
	break;
	case 1:
		sel_timer--;
		if !sel_timer
		{
			if sel_cursor == LevSel_items.Char
				sel_cursor = LevSel_items.GHZ1
			else
				sel_cursor++;
			sel_timer = sel_delay;
		}
	break;
	default:
		sel_timer = 0;
	break;
}
switch(scroll_h)
{
	case -1:
	case 1:
		sel_timer_2--;
		if !sel_timer_2
		{
			var data = global.LevSelect_Data[sel_cursor].across;
			if data != -1
				sel_cursor = data
			else
				if sel_cursor == LevSel_items.Char
					sel_char = scr_wrap_value(sel_char+scroll_h, 7);
			sel_timer_2 = sel_delay;
		}
	break;
	default:
		sel_timer_2 = 0;
	break;
}
if global.k_st_p
{
	var data = global.LevSelect_Data[sel_cursor].level;
	if data != -1
	{
		scr_trigger_fade(data);
		playermode = sel_char;
	}
}
