/// @description Insert description here

var _speed = 0.01;
var _left = keyboard_check(ord("D"));
var _right = keyboard_check(ord("A"));
var _up = keyboard_check(ord("S"));
var _down = keyboard_check(ord("W"));

if _left
{
	obj_ship.image_angle -= 4;
}

if _right
{
	obj_ship.image_angle += 4;	
}

if _down
{
	motion_add(obj_ship.image_angle + 270, _speed);
}

if _up
{
	motion_add(obj_ship.image_angle, -_speed);
}
