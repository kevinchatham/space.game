/// @description Ship Collision

if (!playing_sound) {
  playing_sound = true;
  audio_play_sound(snd_collision, 1, false, global.effect_volume / 5);
}

if (image_index == 0) {
  other.current_health -= damage;
  log(string(other.current_health));
  asteroid.current_health = 0;
  image_speed = 1;
}
