/// @description Rotate

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

if (_right) {
  image_angle -= 2;
}

if (_left) {
  image_angle += 2;
}

part_type_gravity(global.particles, 0.02, image_angle + 270);

// ! GPT
// Define the size of the emitter region
var emitter_width = 8; // Adjust this according to your needs
var emitter_height = 1; // Adjust this according to your needs

// Calculate the offset from the ship's center to the bottom center
var offset_x = lengthdir_x(sprite_height / 2, image_angle + 270);
var offset_y = lengthdir_y(sprite_height / 2, image_angle + 270);

// Calculate the coordinates of the emitter region based on the bottom center
var emitter_left = x - emitter_width / 2 + offset_x;
var emitter_right = emitter_left + emitter_width;
var emitter_top = y - emitter_height + offset_y + 1;
var emitter_bottom = emitter_top + emitter_height;

// Create the particle emitter region
part_emitter_region(
  global.particle_system,
  global.emitter_2,
  emitter_left,
  emitter_right,
  emitter_top,
  emitter_bottom,
  ps_shape_rectangle,
  ps_distr_linear
);
// !
