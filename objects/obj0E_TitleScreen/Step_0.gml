/// @description Handle PSB Blinking

if fading exit;

// PSB triggers at the end of initial animation
if (PSB & !instance_exists(obj0F_PSB))
	instance_create_layer(room_width/2 - 8,y+176-112,"Instances",obj0F_PSB);