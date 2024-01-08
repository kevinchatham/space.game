/// @description Rotate

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

if (_right) {
  image_angle -= 4;
}

if (_left) {
  image_angle += 4;
}

global.particle1 = part_type_create();

part_particles_create_color(ParticleSystem1.id,x,y,global.particle1,c_red,1)
