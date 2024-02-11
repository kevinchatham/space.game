camera_set_view_size(camera, view_width, view_height);

var _x = obj_ship.x - view_width / 2;
var _y = obj_ship.y - view_height / 2;

var _cur_x = camera_get_view_x(camera);
var _cur_y = camera_get_view_y(camera);

// camera interpolation
var _lerp_x = lerp(_cur_x, _x, camera_speed);
var _lerp_y = lerp(_cur_y, _y, camera_speed);

camera_set_view_pos(camera, _lerp_x, _lerp_y);

// update distributed variables
view_port_min_x = camera_get_view_x(camera);
view_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera);
view_port_min_y = camera_get_view_y(camera);
view_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera);

spawn_port_min_x = camera_get_view_x(camera) - camera_get_view_width(camera);
spawn_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera) * spawn_port_scale;
spawn_port_min_y = camera_get_view_y(camera) - camera_get_view_height(camera);
spawn_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera) * spawn_port_scale;

if (fade_timer > 0) {
  fade_timer--;
  alpha = fade_timer / fade_duration;
}
