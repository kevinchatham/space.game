// ! Point To Closest Off Screen Rock;
var _rotation_speed = 50; // higher is slower
var _closest_distance = -1;
var _closest_rock = noone; // noone means no instance found

with (object_rock) {
  var _distance = point_distance(x, y, object_arrow.x, object_arrow.y);

  // If the rock is on-screen or at distance 0, skip to the next iteration
  if (
    _distance == 0 ||
    point_in_rectangle(
      x,
      y,
      view_xview - 50,
      view_yview - 50,
      view_xview + view_wview + 50,
      view_yview + view_hview + 50
    )
  ) {
    continue;
  }

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
