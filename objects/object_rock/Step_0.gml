// ! Controls
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// ! Animation
image_angle += rotation_speed;
image_angle = (image_angle + 360) % 360; // lock rotation to 360 degree range

// ! Movement
if (_up) {
  if (speed < max_speed) {
    // rocks moving opposite of ship angle
    motion_add(object_ship.image_angle + 270, acceleration);
  } else {
    speed -= deceleration;
  }
}

if (_down) {
  if (speed > min_speed) {
    speed -= deceleration;
  } else motion_set(direction, min_speed);
}

// ! Despawn
var _despawn_distance = object_rock_spawner.spawn_distance * 1.25; // Always larger than the spawn_distance

var _x_view = camera_get_view_x(view_camera);
var _y_view = camera_get_view_y(view_camera);
var _w_view = camera_get_view_width(view_camera);
var _h_view = camera_get_view_height(view_camera);
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
