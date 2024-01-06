// ! Point To Closest Off Screen Rock;
var _rotation_speed = 50; // higher is slower
var _closest_distance = -1;
var _closest_rock = noone; // noone means no instance found

with (object_rock) {
  var _distance = point_distance(x, y, object_arrow.x, object_arrow.y);

  var _x_view = camera_get_view_x(view_camera);
  var _y_view = camera_get_view_y(view_camera);
  var _w_view = camera_get_view_width(view_camera);
  var _h_view = camera_get_view_height(view_camera);
  var _on_screen = point_in_rectangle(
    x,
    y,
    _x_view - 50,
    _y_view - 50,
    _x_view + _w_view + 50,
    _y_view + _h_view + 50
  );

  if (_distance == 0 || _on_screen) continue;

  // If _distance is closer than the current closest, update closest_rock
  if (_closest_distance == -1 || _distance < _closest_distance) {
    _closest_distance = _distance;
    _closest_rock = id;
  }
}

if (_closest_rock == noone) return;

var _angle_to_closest = point_direction(
  object_arrow.x,
  object_arrow.y,
  _closest_rock.x,
  _closest_rock.y
);

// Smoothly interpolate the angle
object_arrow.image_angle +=
  angle_difference(_angle_to_closest - 90, object_arrow.image_angle) /
  _rotation_speed;
