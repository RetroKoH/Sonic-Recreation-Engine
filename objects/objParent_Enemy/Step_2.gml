/// @description Screen Check
// If outside view...
if scr_outside_view()==true
{
    // If active, deactivate the enemy.
    if (active==true)
    {
        x=xstart;
        y=ystart;
        xsp=0;
        ysp=0;
		routine=0;
        active=false;
        visible=false;
        can_hit=false;
        can_respawn=false;  // This will be set to true when start pos is not in view.
    }
    // If inactive, check if it can be respawned, and set it up to be respawned again.
    else if (can_respawn==false)
        can_respawn=true;
}

// If inside view...
else if (active==false && can_respawn==true)
{
    // Reactivate if inactive, and able to respawn
    active=true;
    visible=true;
    can_hit=true;
	is_respawning=true;
}