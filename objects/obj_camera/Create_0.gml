view_width = 1920 / 4;
view_height = 1080 / 4;
window_scale = 3;
camera_border = 50;
scaled_width = view_width * window_scale;
scaled_height = view_height * window_scale;

// scale window using alarm / window_center()
window_set_size(scaled_width, scaled_height);
alarm[0] = 1; // needs to be set after window_set_size

surface_resize(application_surface, scaled_width, scaled_height);

camera_set_view_pos(view_camera[0], obj_ship.x, obj_ship.y);
