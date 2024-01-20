if (inside_view_port(obj_space_camera.camera, x, y)) {
  audio_play_sound(snd_collision, 1, false, global.volume);
}

sprite_index = this.animation_sprite_index;

var _animation_finished = image_index >= image_number - 1;

if (_animation_finished) {
  instance_destroy();
}
