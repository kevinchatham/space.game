view_width = 1920 / 4;
view_height = 1080 / 4;
window_scale = 4;
camera_border = 50;
scaled_width = view_width * window_scale;
scaled_height = view_height * window_scale;

// scale window using alarm / window_center()
window_set_size(scaled_width, scaled_height);
alarm[0] = 1;

surface_resize(application_surface, scaled_width, scaled_height);
