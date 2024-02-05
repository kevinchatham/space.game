var _direction_to_player = point_direction(x, y, obj_ship.x, obj_ship.y);
var _distance_to_player = point_distance(x, y, obj_ship.x, obj_ship.y);
var _distance_to_origin = point_distance(x, y, origin_x, origin_y);

// if (_distance_to_player < attack_radius) {
//   state = "attack";
// } else if (_distance_to_origin > 750) {
//   state = "retreat";
// } else {
//   state = "idle";
// }

state = "attack";

if (state == "idle") {
  if (path_position == 1) {
    var _i = irandom(array_length(idle_manuvers) - 1);
    path_start(idle_manuvers[_i], max_speed, path_action_stop, false);
  }

  image_angle += angle_difference((direction - 90) % 360, image_angle) * turn_speed;
}

if (state == "attack") {
  // ! rotate
  image_angle += angle_difference((_direction_to_player - 90) % 360, image_angle) * turn_speed;

  // ! move
  var _speed_factor = _distance_to_player / 100;
  var _current_speed = max_speed - _speed_factor * (max_speed - 0); // 0 is min speed

  log("sf", string(_speed_factor));
  log("cs", string(_current_speed));

  move_towards_point(obj_ship.x, obj_ship.y, _current_speed);

  // ! fire
  var _fire_rate = 2; // per second

  if (can_shoot && inside_view_port(obj_space_camera.camera, x, y)) {
    audio_play_sound(snd_blaster, 1, false, global.effect_volume);

    var _base_angle = (image_angle + 270) % 360;

    var _offset = -30;
    var _offset_x = lengthdir_x(sprite_width / 2 + _offset, _base_angle);
    var _offset_y = lengthdir_y(sprite_height / 2 + _offset, _base_angle);

    instance_create_layer(x + _offset_x, y + _offset_y, global.main_layer, obj_enemy_bullet, {
      speed: 3,
      image_angle: _direction_to_player,
      image_xscale: 0.1,
      image_yscale: 0.1
    });
    can_shoot = false;
    alarm[1] = round(60 / _fire_rate);
  }
}

if (state == "retreat") {
  move_towards_point(origin_x, origin_y, max_speed);
  if (x == origin_x && y == origin_y) {
    state = "idle";
  }
}
