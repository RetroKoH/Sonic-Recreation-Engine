function scr_init_animals(){
	globalvar ani_sprite, ani_xsp, ani_ysp;
	var ani = 0;
	// 0 - Flicky (Bluebird)
	ani_sprite[ani] = spr_animal_flicky;
	ani_xsp[ani] = -3;
	ani_ysp[ani] = -4;
	
	ani++;
	// 1 - Ricky (Squirrel)
	ani_sprite[ani] = spr_animal_ricky;
	ani_xsp[ani] = -2.5;
	ani_ysp[ani] = -3.5;

	ani++;
	// 2 - Pocky (Rabbit)
	ani_sprite[ani] = spr_animal_pocky;
	ani_xsp[ani] = -2;
	ani_ysp[ani] = -4;

	ani++;
	// 3 - Pecky (Penguin)
	ani_sprite[ani] = spr_animal_pecky;
	ani_xsp[ani] = -1.5;
	ani_ysp[ani] = -2.5;
	
	ani++;
	// 4 - Picky (Pig)
	ani_sprite[ani] = spr_animal_picky;
	ani_xsp[ani] = -1.75;
	ani_ysp[ani] = -3;
	
	ani++;
	// 5 - Clucky (Chicken)
	ani_sprite[ani] = spr_animal_clucky;
	ani_xsp[ani] = -2;
	ani_ysp[ani] = -3;
	
	ani++;
	// 6 - Rocky (Seal)
	ani_sprite[ani] = spr_animal_rocky;
	ani_xsp[ani] = -1.25;
	ani_ysp[ani] = -1.5;
}