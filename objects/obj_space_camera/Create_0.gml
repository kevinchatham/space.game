/// @param {Real} _width
/// @param {Real} _height
/// @param {Real} _scale
/// @param {Bool} _pan
function refresh_view_port(_scale, _pan = false) {
  window_scale = _scale;
  view_width = default_view_width / _scale;
  view_height = default_view_height / _scale;
  scaled_view_width = view_width * window_scale;
  scaled_view_height = view_height * window_scale;

  // needs to be in this order
  // window size -> alarm window center -> surface resize -> set camera pos
  window_set_size(scaled_view_width, scaled_view_height);
  alarm[0] = 1;
  surface_resize(application_surface, scaled_view_width, scaled_view_height);

  if (_pan) {
    camera_set_view_pos(camera, obj_ship.x, obj_ship.y);
  } else {
    camera_set_view_pos(camera, obj_ship.x - view_width / 2, obj_ship.y - view_height / 2);
  }

  // these are updated every end step
  view_port_min_x = camera_get_view_x(camera);
  view_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera);
  view_port_min_y = camera_get_view_y(camera);
  view_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera);

  spawn_port_min_x = camera_get_view_x(camera) - camera_get_view_width(camera);
  spawn_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera) * spawn_port_scale;
  spawn_port_min_y = camera_get_view_y(camera) - camera_get_view_height(camera);
  spawn_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera) * spawn_port_scale;
}

draw_port_padding = 5;
draw_view_port = true;
draw_particle_emitter_regions = false;

camera = view_camera[0];
camera_speed = 0.015;
default_view_width = 1920;
default_view_height = 1080;
min_window_scale = 3; // higher is zoomed in
max_window_scale = 1; // lower is zoomed out
spawn_port_scale = 3;

// these are updated dynamically
window_scale = 0;
view_width = 0;
view_height = 0;
scaled_view_width = 0;
scaled_view_height = 0;
view_port_min_x = 0;
view_port_max_x = 0;
view_port_min_y = 0;
view_port_max_y = 0;
spawn_port_min_x = 0;
spawn_port_max_x = 0;
spawn_port_min_y = 0;
spawn_port_max_y = 0;
//

refresh_view_port(min_window_scale, true);

// despawn items outside of camera / spawn port
alarm[1] = global.despawn_lifetime;
