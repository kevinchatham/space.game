/// @description Rotate

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

if (_right) {
  image_angle -= 1;
}

if (_left) {
  image_angle += 1;
}

var _base_angle = image_angle + 270; // Ensure the angle is within [0, 360) range

part_type_direction(global.particles, _base_angle, _base_angle, 0, 0);

// * there is no gravity in space
// part_type_gravity(global.particles, 0.04, _base_angle);

// ! GPT
// Define the size of the emitter region
var _emitter_radius = 6;
var _base_offset = 4;

// Calculate the offset from the ship's center to the bottom center with horizontal adjustment
var _offset_x = lengthdir_x(sprite_width / 2 + _base_offset, _base_angle);
var _offset_y = lengthdir_y(sprite_height / 2 + _base_offset, _base_angle);

// Calculate the coordinates of the center of the circle
var _center_x = x + _offset_x;
var _center_y = y + _offset_y;

// Calculate bounding box of the circle
var _emitter_left = _center_x - _emitter_radius;
var _emitter_right = _center_x + _emitter_radius;
var _emitter_top = _center_y - _emitter_radius;
var _emitter_bottom = _center_y + _emitter_radius;

// Create the particle emitter region
part_emitter_region(
  global.particle_system,
  global.emitter_2,
  _emitter_left,
  _emitter_right,
  _emitter_top,
  _emitter_bottom,
  ps_shape_ellipse,
  ps_distr_linear
);
// !
