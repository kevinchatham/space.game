audio_play_sound(snd_collision, 1, false, global.volume);

if (sprite_index != asteroid.animation_sprite_index) {
  asteroid.max_health = 0;
  sprite_index = asteroid.animation_sprite_index;
}
