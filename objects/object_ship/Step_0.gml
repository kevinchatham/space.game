/// @description Rotate

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

if (_right) {
  image_angle -= 4;
}

if (_left) {
  image_angle += 4;
}
