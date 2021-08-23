function DLE_GHZ1(){
	if instance_exists(player)
	{
		// Increase the vertical boundary as we go through the S-tunnels.
		if player.x < 6400
			v_limitbtm1 = 988;
		else
			v_limitbtm1 = 1248;
	}
}