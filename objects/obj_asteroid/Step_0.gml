// ! Animation
motion_set(direction, asteroid.min_speed);
image_angle += asteroid.rotation_speed;

var _animation_finished = image_index >= image_number - 1;

if (
  obj_space_camera.inside_view_port(x, y) &&
  !_animation_finished &&
  asteroid.current_health <= 0 &&
  !playing_sound
) {
  playing_sound = true;
  var _i = irandom(array_count(sounds));
  audio_play_sound(sounds[_i], 1, false, global.effect_volume);
}

if (_animation_finished && asteroid.current_health <= 0) {
  for (var _i = 0; _i < array_length(asteroid.next_spawns); _i++) {
    var _c = asteroid.next_spawns[_i].quantity;
    for (var _ii = 0; _ii < _c; _ii++) {
      var _x = x + irandom(20);
      var _y = y + irandom(20);
      var _id = instance_create_layer(_x, _y, global.main_layer, obj_resource, {
        init_json: json_stringify(asteroid.next_spawns[_i].item)
      });
    }
  }
  instance_destroy();
}
