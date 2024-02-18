/// @description Ship Collision

if (!playing_sound) {
  playing_sound = true;
  audio_play_sound(snd_collision, 1, false, global.effect_volume / 5);
}

if (sprite_index != asteroid.animation_sprite_index) {
  other.current_health -= damage;
  log(string(current_health));
  asteroid.current_health = 0;
  sprite_index = asteroid.animation_sprite_index;
}
