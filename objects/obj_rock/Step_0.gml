/// @description Insert description here

var _speed = 0.01;
var _min_speed = 0;
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

if _down
{
	if(speed > _min_speed)
	{
		speed -= _speed;
	}
}

if _up
{
	motion_add(obj_ship.image_angle + 270, _speed);
}
