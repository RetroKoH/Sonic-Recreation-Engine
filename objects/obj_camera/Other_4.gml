/// @description Establish View at start of room
view = view_camera[0];
if (lamp_last) camera_set_view_pos(cam.view,lamp_scrx,lamp_scry);
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view, view_width, view_height);
camera_set_view_speed(view,16,16);
camera_set_view_border(view,204,96);