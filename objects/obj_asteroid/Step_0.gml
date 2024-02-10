// ! Animation
motion_set(direction, asteroid.min_speed);
image_angle += asteroid.rotation_speed;

var _animation_finished = image_index >= image_number - 1;

if (
  inside_view_port(obj_space_camera.camera, x, y, -50) &&
  !_animation_finished &&
  asteroid.max_health <= 0 &&
  !playing_sound
) {
  playing_sound = true;
  var _i = irandom(array_length(sounds) - 1);
  audio_play_sound(sounds[_i], 1, false, global.effect_volume);
}

if (_animation_finished && asteroid.max_health <= 0) {
  for (var _i = 0; _i < asteroid.next_spawn.count; _i++) {
    var _x = x + irandom(20);
    var _y = y + irandom(20);
    var _id = instance_create_layer(_x, _y, global.main_layer, obj_resource, asteroid.next_spawn);
  }
  instance_destroy();
}
