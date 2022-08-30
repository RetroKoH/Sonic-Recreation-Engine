/// @description Debug info
draw_text(112,8,"SONIC   X: "+string(x)+
				"\n        Y: "+string(y)+
				"\nG SPEED: "+string(gsp)+"\nX SPEED: "+string(xsp)+"\nY SPEED: "+string(ysp)+
				"\nANGLE: "+string(angle)+"  ("+string(anim_angle)+")"+
				"\n"+string(col_tile_A)+
				"\n"+string(defaultHeight)+" "+string(height)+
				"\nDOUBLE JUMP: "+string(double_jump_flag)+" : "+string(double_jump_property));

draw_text(282,8,"STATUS: "+string(status)+"  CTRL"+string(ctrl)+
				"\nFACE LEFT: "+string(status&STA_FACING)+
				"\nIN AIR: "+string((status&STA_INAIR)/STA_INAIR)+
				"\nSPINNING: "+string((status&STA_SPIN)/STA_SPIN)+
				"\nON OBJECT: "+string((status&STA_ONOBJ)/STA_ONOBJ)+
				"\nROLL JUMP: "+string((status&STA_ROLLJUMP)/STA_ROLLJUMP)+
				"\nPUSHING: "+string((status&STA_PUSH)/STA_PUSH)+
				"\nUNDERWATER: "+string((status&STA_WATER)/STA_WATER));
				
draw_text(452,8,"\nSHIELD: "+string(powerups&POW_SHIELD)+" "+string(my_shield)+
				"\nINVINCIBILITY: "+string((powerups&POW_INVINC)/POW_INVINC)+": "+string(invinc_timer)+
				"\n"+string(my_stars));