var _camera_padding = 25;
x = obj_space_camera.view_port_max_x - _camera_padding;
y = obj_space_camera.view_port_min_y + _camera_padding * 3;

var _rotation_speed = 50; // higher is slower
var _closest_distance = -1;
var _closest_id = noone;

with (obj_worm_hole) {
  if (inside_view_port(obj_space_camera.camera,x,y)) continue;

  var _distance = point_distance(x, y, obj_ship.x, obj_ship.y);

  // If _distance is closer than the current closest, update closest_rock
  if (_closest_distance == -1 || _distance < _closest_distance) {
    _closest_distance = _distance;
    _closest_id = id;
  }
}

if (_closest_id == noone) return;

var _angle_to_closest = point_direction(x, y, _closest_id.x, _closest_id.y);

// Smoothly interpolate the angle
image_angle += angle_difference(_angle_to_closest - 90, image_angle) / _rotation_speed;
