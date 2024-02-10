/// @arg {Real} _new_angle
/// @arg {Real} _change_speed
/// @arg {Real} _angular_threshold
function change_direction(_new_angle, _change_speed, _angular_threshold) {
  var _ang_dif = angle_difference(direction, _new_angle);

  if (_ang_dif > _angular_threshold) {
    direction -= _change_speed;
  } else if (_ang_dif < _angular_threshold) {
    direction += _change_speed;
  }
}

// Find friends
var _friends = [];
var _friends_count = 0;
var _enemies = [];
var _enemies_count = 0;

with (obj_enemy) {
  if (id != other.id) {
    // not me
    if (point_distance(x, y, other.x, other.y) < friend_padding) {
      // we've found a friend!
      _friends[_friends_count] = id;
      _friends_count++;
    }
    if (point_distance(x, y, other.x, other.y) < enemy_padding) {
      // This one is too near
      _enemies[_enemies_count] = id;
      _enemies_count++;
    }
  }
}

// Match direction of friends
if (_friends_count > 0) {
  var _running_angle = 0;

  for (var _i = 0; _i < _friends_count; _i++) {
    _running_angle += _friends[_i].direction;
  }

  _running_angle /= _friends_count;

  change_direction(_running_angle, friend_alignment_weight * turn_speed, angular_offset);
}

// Go to the middle of friends
if (_friends_count > 0) {
  var _running_x = 0;
  var _running_y = 0;

  for (var _i = 0; _i < _friends_count; _i++) {
    _running_x += _friends[_i].x;
    _running_y += _friends[_i].y;
  }

  _running_x /= _friends_count;
  _running_y /= _friends_count;

  // Slowly move to match this average position
  var _goto_dir = point_direction(x, y, _running_x, _running_y);
  change_direction(_goto_dir, friend_center_weight * turn_speed, angular_offset);
}

// Try and keep some distance between friends
if (_enemies_count > 0) {
  // This just finds their average position
  var _running_x = 0;
  var _running_y = 0;

  for (var _i = 0; _i < _enemies_count; _i++) {
    _running_x += _enemies[_i].x;
    _running_y += _enemies[_i].y;
  }

  _running_x /= _enemies_count;
  _running_y /= _enemies_count;

  // Slowly move to match this average angle
  var _goto_dir = point_direction(x, y, _running_x, _running_y) + 180;
  change_direction(_goto_dir, enemy_avoidance_weight * turn_speed, angular_offset);
}

// stay in the area
if (!point_in_rectangle(x, y, area_x1, area_y1, area_x2, area_y2)) {
  // I'm off the screen
  var _goto_dir = point_direction(x, y, room_width / 2, room_height / 2);
  change_direction(_goto_dir, obstacle_avoidance_weight * turn_speed, angular_offset);
}

// avoid asteroids
var _closest_asteroid = instance_nearest(x, y, obj_asteroid);
var _asteroid_distance = distance_to_object(_closest_asteroid);
if (_asteroid_distance < obstacle_padding) {
  var _goto_dir = point_direction(x, y, _closest_asteroid.x, _closest_asteroid.y) + 180;
  change_direction(_goto_dir, obstacle_avoidance_weight * turn_speed, angular_offset);
}

// attack the cursor
var _player_distance = distance_to_point(obj_ship.x, obj_ship.y);
if (_player_distance < attack_padding) {
  var _goto_dir = point_direction(x, y, obj_ship.x, obj_ship.y);
  change_direction(_goto_dir, attack_weight * turn_speed, angular_offset);
}

// this needs a little bit of work but you need to be able to determine the player direction first
// retreat from the cursor
if (_player_distance < retreat_padding) {
  var _goto_dir = point_direction(x, y, obj_ship.x, obj_ship.y) + 180;
  change_direction(_goto_dir, attack_weight * turn_speed * retreat_weight, angular_offset);
}

image_angle = direction;
