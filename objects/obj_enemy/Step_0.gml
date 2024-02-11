var _player_distance = distance_to_point(obj_ship.x, obj_ship.y);
var _friends = [];
var _friends_count = 0;
var _enemies = [];
var _enemies_count = 0;
var _closest_asteroid = instance_nearest(x, y, obj_asteroid);
var _closest_asteroid_distance = distance_to_object(_closest_asteroid);

in_combat = false;

// attack
if (_player_distance < attack_radius) {
  // use this condition if you don't want the enemy to dive bomb the player
  // _player_distance < attack_radius && _player_distance > retreat_radius

  in_combat = true;

  if (speed < speed_max) {
    speed += 0.01;
  }

  if (!detonation_triggered) {
    detonation_triggered = true;
    alarm[2] = detonation_delay;
  }

  var _goto_dir = point_direction(x, y, obj_ship.x, obj_ship.y);

  change_direction(_goto_dir, speed_turn * attack_weight, angular_offset);
}

// retreat if player is facing the enemy
if (_player_distance < retreat_radius) {
  in_combat = true;

  if (speed < speed_max) {
    speed += 0.01;
  }

  var _player_direction = point_direction(obj_ship.x, obj_ship.y, x, y);

  var _angle_difference = abs(angle_difference(obj_ship.direction, _player_direction));

  // stop detonation timer and retreat
  if (_angle_difference < retreat_angular_threshold) {
    detonation_triggered = false;
    alarm[2] = -1;
    var _goto_dir = point_direction(x, y, obj_ship.x, obj_ship.y) + 180;
    change_direction(_goto_dir, speed_turn * retreat_weight, 0);
  }
}

if (!in_combat && speed > speed_min) {
  speed -= 0.01;
}

// ! find friends
with (obj_enemy) {
  if (id != other.id) {
    // not me
    if (point_distance(x, y, other.x, other.y) < friend_radius) {
      // we've found a friend!
      _friends[_friends_count] = id;
      _friends_count++;
    }
    if (point_distance(x, y, other.x, other.y) < enemy_radius) {
      // This one is too near
      _enemies[_enemies_count] = id;
      _enemies_count++;
    }
  }
}

// ! match direction of friends
if (_friends_count > 0) {
  var _running_angle = 0;

  for (var _i = 0; _i < _friends_count; _i++) {
    _running_angle += _friends[_i].direction;
  }

  _running_angle /= _friends_count;

  change_direction(_running_angle, friend_alignment_weight * speed_turn, angular_offset);
}

// ! go to the middle of friends
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
  change_direction(_goto_dir, friend_center_weight * speed_turn, angular_offset);
}

// ! keep some distance between friends
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
  change_direction(_goto_dir, enemy_avoidance_weight * speed_turn, angular_offset);
}

// ! stay in the area
if (!point_in_rectangle(x, y, area_x1, area_y1, area_x2, area_y2)) {
  // I'm off the screen
  var _goto_dir = point_direction(x, y, obj_ship.x, obj_ship.y);
  change_direction(_goto_dir, obstacle_avoidance_weight * speed_turn, angular_offset);
}

// ! avoid asteroids
if (_closest_asteroid_distance < obstacle_radius) {
  var _goto_dir = point_direction(x, y, _closest_asteroid.x, _closest_asteroid.y) + 180;
  change_direction(_goto_dir, obstacle_avoidance_weight * speed_turn, angular_offset);
}

// ! add noise
noise_elapsed++;
if (noise_elapsed == noise_elapsed_max) {
  noise_elapsed = 0;
  noise_direction *= -1;
}
direction += noise_magnitude * sin(noise_elapsed / noise_frequency) * noise_direction;
direction = direction % 360;
image_angle = direction;
