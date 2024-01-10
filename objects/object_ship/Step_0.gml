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
