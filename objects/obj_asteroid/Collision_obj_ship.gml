audio_play_sound(snd_collision, 1, false, global.volume);

sprite_index = this.animation_sprite_index;

if (image_index >= image_number - 1) {
  instance_destroy();
}
