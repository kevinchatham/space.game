var _camera_speed = 1;

camera_set_view_size(view_camera[0], view_width, view_height);

if (!instance_exists(obj_ship)) return;

var _x = clamp(obj_ship.x - view_width / 2, 0, room_width - view_width);
var _y = clamp(obj_ship.y - view_height / 2, 0, room_height - view_height);

var _cur_x = camera_get_view_x(view_camera[0]);
var _cur_y = camera_get_view_y(view_camera[0]);

// camera interpolation
var _lerp_x = lerp(_cur_x, _x, _camera_speed);
var _lerp_y = lerp(_cur_y, _y, _camera_speed);

camera_set_view_pos(view_camera[0], _lerp_x, _lerp_y);
