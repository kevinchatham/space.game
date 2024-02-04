var _direction_to_player = point_direction(x, y, obj_ship.x, obj_ship.y);
var _distance_to_player = point_distance(x, y, obj_ship.x, obj_ship.y);
var _distance_to_origin = point_distance(x, y, origin_x, origin_y);

if (_distance_to_player < attack_radius) {
  state = "attack";
} else if (_distance_to_origin > 750) {
  state = "retreat";
} else {
  state = "idle";
}

if (state == "idle") {
  if (path_position == 1) {
    var _i = irandom(array_length(idle_manuvers) - 1);
    path_start(idle_manuvers[_i], max_speed, path_action_stop, false);
  }

  image_angle += angle_difference((direction - 90) % 360, image_angle) * turn_speed;
}

if (state == "attack") {
  image_angle += angle_difference((_direction_to_player - 90) % 360, image_angle) * turn_speed;

  if (speed < max_speed) {
    motion_add(image_angle, acceleration);
  } else {
    speed -= deceleration;
  }

  var _fire_rate = 2; // per second

  if (can_shoot) {
    audio_play_sound(snd_blaster, 1, false, global.effect_volume);
    instance_create_layer(x, y, global.main_layer, obj_enemy_bullet, {
      speed: 3,
      image_angle: image_angle + 90,
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
