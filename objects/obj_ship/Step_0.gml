var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

if (_right) {
  image_angle -= 1;
}

if (_left) {
  image_angle += 1;
}

base_angle = (image_angle + 270) % 360;

// Calculate the offset from the ship's center to the bottom center with horizontal adjustment
offset_x = lengthdir_x(sprite_width / 2 + base_offset, base_angle);
offset_y = lengthdir_y(sprite_height / 2 + base_offset, base_angle);

// Calculate the coordinates of the center of the circle
center_x = x + offset_x;
center_y = y + offset_y;

// Calculate bounding box of the circle
emitter_left = center_x - emitter_radius;
emitter_right = center_x + emitter_radius;
emitter_top = center_y - emitter_radius;
emitter_bottom = center_y + emitter_radius;

part_type_direction(
  global.thruster_particle_type,
  base_angle,
  base_angle,
  0,
  0
);

part_emitter_region(
  global.particle_system,
  global.thruster_particle_emitter,
  emitter_left,
  emitter_right,
  emitter_top,
  emitter_bottom,
  ps_shape_ellipse,
  ps_distr_linear
);

// ! Begin fuckery
// ! This maintains a fake speed dependent upon the speed of the first rock found.
// ! It allows the thruster particles to maintain a constant speed and alpha value.
// ! Otherwise the speed / alpha values are reset every time a rock is destroyed.
// ! If that happens the thruster is not constant and it looks very strange.
var _obj = noone;

with (obj_rock) {
  _obj = obj_rock;
  break;
}

if (_obj != noone) {
  if (_up) {
    if (fake_speed < _obj.max_speed) {
      fake_speed += _obj.acceleration;
    }
  }

  if (_down) {
    if (fake_speed > _obj.min_speed) {
      fake_speed -= _obj.deceleration;
    } else {
      fake_speed = _obj.min_speed;
    }
  }

  // Smoothly transition alpha value based on speed
  if (_obj.speed > _obj.min_speed) {
    part_type_speed(
      global.thruster_particle_type,
      0,
      _obj.speed,
      _obj.acceleration,
      0
    );
    target_alpha = lerp(min_alpha, max_alpha, _obj.speed / _obj.max_speed);
  } else {
    part_type_speed(global.thruster_particle_type, 0, 0, _obj.acceleration, 0);
    target_alpha = 0; // Fully transparent
  }

  // Adjust alpha gradually using lerp
  current_alpha = lerp(current_alpha, target_alpha, lerp_speed);
  part_type_alpha3(global.thruster_particle_type, current_alpha, min_alpha, 0);
}
// !
