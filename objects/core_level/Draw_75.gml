/// @description Process Paused Objects
if !(run_objects) && !(fading) && (f_levelstarted)
{
	instance_deactivate_all(true);
		
	// Activate controllers, we need them!
	instance_activate_object(Core_);
}