if (inside_view_port(obj_space_camera.camera, x, y)) {
  audio_play_sound(snd_collision, 1, false, global.volume);
}

sprite_index = this.animation_sprite_index;

var _animation_finished = image_index >= image_number - 1;

if (_animation_finished) {
  for (var _i = 0; _i < this.next_spawn.count; _i++) {
    var _x = x + irandom(30);
    var _y = y + irandom(30);
    var _id = instance_create_layer(_x, _y, global.main_layer, obj_resource, this.next_spawn);
  }
  instance_destroy();
}
