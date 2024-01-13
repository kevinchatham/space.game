// ! Animation
motion_set(direction, min_speed);
image_angle += rotation_speed;
image_angle = (image_angle + 360) % 360; // lock rotation to 360 degree range

// ! Despawn
var _despawn_distance = obj_rock_spawner.spawn_distance * 1.25; // Always larger than the spawn_distance

var _x_view = camera_get_view_x(view_camera[0]);
var _y_view = camera_get_view_y(view_camera[0]);
var _w_view = camera_get_view_width(view_camera[0]);
var _h_view = camera_get_view_height(view_camera[0]);
var _off_screen = !point_in_rectangle(
  x,
  y,
  _x_view - _despawn_distance,
  _y_view - _despawn_distance,
  _x_view + _w_view + _despawn_distance,
  _y_view + _h_view + _despawn_distance
);

// Check if the rock is off-screen before despawn
if (_off_screen) {
  instance_destroy();
  show_debug_message("Destroyed rock at x: " + string(x) + ", y: " + string(y));
}
