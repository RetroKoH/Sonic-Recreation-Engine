function DLE_GHZ1(){
	if instance_exists(player)
	{
		// Increase the vertical boundary as we go through the S-tunnels.
		if player.x < 6400
			v_limitbtm2 = 988;
		// Increase the vertical boundary as proceed to the Act 2 layout
		else if player.x < 8080
			v_limitbtm2 = 1248;
		else
			v_limitbtm2 = 1496;
	}
}