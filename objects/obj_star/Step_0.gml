// ! Controls
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// ! Animation
image_angle += rotation_speed;
image_angle = (image_angle + 360) % 360; // lock rotation to 360 degree range

// ! Movement
if (_up) {
  if (speed < max_speed) {
    // moving opposite of ship angle
    motion_add(obj_ship.image_angle + 270, acceleration);
  }
}

if (_down) {
  if (speed > min_speed) {
    speed -= deceleration;
  } else motion_set(direction, min_speed);
}
