var _up = keyboard_check(ord("W"));
var _left = keyboard_check(ord("A"));
var _down = keyboard_check(ord("S"));
var _right = keyboard_check(ord("D"));

// ! Movement
if (_up) {
  if (speed < max_speed) {
    motion_add(image_angle + 90, acceleration);
  } else {
    speed -= deceleration;
  }
}

if (_down) {
  if (speed > min_speed) {
    speed -= deceleration;
  } else {
    motion_set(direction, min_speed);
  }
}

if (_right) {
  image_angle -= rotation_speed;
  motion_set(image_angle + 90,  speed)
}

if (_left) {
  image_angle += rotation_speed;
  motion_set(image_angle + 90,  speed)
}

if (!keyboard_controlled) {
  var _target_angle = point_direction(x, y, mouse_x, mouse_y) + 90;
  var _diff = angle_difference(image_angle, _target_angle);
  if (_diff > rotation_speed) {
    image_angle += rotation_speed;
	motion_set(image_angle + 90,  speed)
  } else if (_diff < -rotation_speed) {
    image_angle -= rotation_speed;
	motion_set(image_angle + 90,  speed)
  }
}

// ! Particles
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

part_type_direction(global.thruster_particle_type, base_angle, base_angle, 0, 0);

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

// Smoothly transition alpha value based on speed
if (speed > min_speed) {
  part_type_speed(global.thruster_particle_type, min_speed, speed, acceleration, 0);
  target_alpha = lerp(min_alpha, max_alpha, speed / max_speed);
} else {
  part_type_speed(global.thruster_particle_type, 0, 0, acceleration, 0);
  target_alpha = 0; // Fully transparent
}

// Adjust alpha gradually using lerp
current_alpha = lerp(current_alpha, target_alpha, lerp_speed);
part_type_alpha3(global.thruster_particle_type, current_alpha, min_alpha, 0);
