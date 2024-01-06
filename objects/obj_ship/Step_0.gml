/// @description Insert description here

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

if _right
{
	obj_ship.image_angle -= 4;
}

if _left
{
	obj_ship.image_angle += 4;	
}
