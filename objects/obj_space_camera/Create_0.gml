draw_view_port = false;
draw_spawn_port = false;
draw_particle_emitter_regions = false;

camera = view_camera[0];
camera_speed = 0.015;

window_scale = 3;

view_width = 1920 / window_scale;
view_height = 1080 / window_scale;
scaled_view_width = view_width * window_scale;
scaled_view_height = view_height * window_scale;

// needs to be in this order
// window size -> alarm window center -> surface resize -> set camera pos
window_set_size(scaled_view_width, scaled_view_height);
alarm[0] = 1;
surface_resize(application_surface, scaled_view_width, scaled_view_height);
camera_set_view_pos(camera, obj_ship.x, obj_ship.y);

// these are updated every end step
view_port_min_x = camera_get_view_x(camera);
view_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera);
view_port_min_y = camera_get_view_y(camera);
view_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera);

spawn_port_min_x = camera_get_view_x(camera) - camera_get_view_width(camera);
spawn_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera) * 3;
spawn_port_min_y = camera_get_view_y(camera) - camera_get_view_height(camera);
spawn_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera) * 3;

// despawn items outside of camera / spawn port
alarm[1] = global.despawn_lifetime;
