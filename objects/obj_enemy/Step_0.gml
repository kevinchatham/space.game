var _direction_to_player = point_direction(x, y, obj_ship.x, obj_ship.y);
var _distance_to_player = point_distance(x, y, obj_ship.x, obj_ship.y);
var _distance_to_origin = point_distance(x, y, origin_x, origin_y);

if (_distance_to_player < 150) {
  state = "attack";
} else if (_distance_to_origin > 500) {
  state = "retreat";
} else {
  state = "idle";
}

if (state == "idle") {
  if (path_position == 1) {
    var _i = irandom(array_length(idle_manuvers) - 1);
    path_start(idle_manuvers[_i], max_speed, path_action_stop, false);
  }

  image_angle += angle_difference(direction - 90, image_angle) * 0.1;
}

if (state == "attack") {
  image_angle = (_direction_to_player + 270) % 360; // += angle_difference(direction - 90, image_angle) * turn_speed;

  if (speed < max_speed) {
    motion_add(image_angle + 90, acceleration);
    motion_add(random(360), 0.025);
  } else {
    speed -= deceleration;
  }

  friction = 0.001;
}

if (state == "retreat") {
  move_towards_point(origin_x, origin_y, max_speed);
  if (x == origin_x && y == origin_y) {
    state = "idle";
  }
}
