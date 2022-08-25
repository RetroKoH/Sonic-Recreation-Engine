function scr_touch_objEnemy(){
	// This script is for handling badnik collision. This will help determine whether Sonic defeats it, or it defeats Sonic...

	var obj = instance_place(x,y,objParent_Enemy); // Parent object for badniks goes here, so it applies to all enemies, with exceptions.

	if (obj!=noone) //&& state!=consStateHurt) // A hurt hedgehog will not react to the enemy. That's just not fair.        
	{
	    // If under certain conditions, we can attack the enemy.
	    if ((status&STA_SPIN || anim_ID==anim_player.spindash) || super || powerups&POW_INVINC)
	    {
	        // Rebound off the enemy, provided we are moving downward, and are NOT on the ground.
	        if ((status&STA_INAIR) && ysp>0)
	        {
	            // Check for the jump button being held.
	            if (global.k_a_h || global.k_b_h || global.k_c_h)
					ysp = -ysp*1.15;
	            else ysp = -ysp*0.99;
	        }
	        // Destroy enemy
	        with(obj) scr_destroy_enemy();
	    }
	    else scr_player_hurt(obj);
	}
}