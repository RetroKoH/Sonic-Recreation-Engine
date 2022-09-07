function DEBUG_DATA(obj_ID,obj_Index,obj_Label){
	with(obj_ID) switch(obj_Index){
		case obj01_Player:
		{
			draw_text(362,8,string(obj_Label)+"   X: "+string(x)+
					"\n        Y: "+string(y)+
					"\nG SPEED: "+string(gsp)+"\nX SPEED: "+string(xsp)+"\nY SPEED: "+string(ysp)+
					"\nANGLE: "+string(angle)+"  ("+string(anim_angle)+")");

			draw_text(522,8,"STATUS: "+string(status)+"  CTRL"+string(ctrl)+
					"\nFACE LEFT: "+string(status&STA_FACING)+
					"\nIN AIR: "+string((status&STA_INAIR)/STA_INAIR)+
					"\nSPINNING: "+string((status&STA_SPIN)/STA_SPIN)+
					"\nON OBJECT: "+string((status&STA_ONOBJ)/STA_ONOBJ)+
					"\nROLL JUMP: "+string((status&STA_ROLLJUMP)/STA_ROLLJUMP)+
					"\nPUSHING: "+string((status&STA_PUSH)/STA_PUSH)+
					"\nUNDERWATER: "+string((status&STA_WATER)/STA_WATER));
				
			draw_text(682,8,"\nDOUBLE JUMP: "+string(double_jump_flag)+" : "+string(double_jump_property)+
					"\nSHIELD: "+string(powerups&POW_SHIELD)+" "+string(my_shield)+
					"\nINVINCIBILITY: "+string((powerups&POW_INVINC)/POW_INVINC)+": "+string(invinc_timer)+
					"\n"+string(my_stars));
		} break;
		case obj02_PathSwapper:
		{
			draw_text(362,8,"Pathswapper"+
					"\n        X: "+string(x)+
					"\n        Y: "+string(y)+
					"\n  Subtype: "+string(subtype)+
					"\n   Radius: "+string(radius));
			draw_text(522,8,
					"   Orientation: "+string(orientation)+
					"\n      R/D Flag: "+string(flag_rightdown)+
					"\n      L/U Flag: "+string(flag_leftup)+
					"\n   Ground Flag: "+string(flag_ground)+
					"\n     Swap Flag: "+string(swap_flag));
		} break;
		case obj03_BallMode:
		{
			draw_text(362,8,"Ball Mode Trigger"+
					"\n        X: "+string(x)+
					"\n        Y: "+string(y)+
					"\n   Radius: "+string(radius));
		} break;
		case obj40_Motobug:
		{
			draw_text(362,8,"Motobug"+
					"\n        X: "+string(x)+
					"\n        Y: "+string(y)+
					"\n   Radius: "+string(height)+"/"+string(width)+
					"\n  Routine: "+string(routine)+"/"+string(routine_2nd));
		} break;
	}
}