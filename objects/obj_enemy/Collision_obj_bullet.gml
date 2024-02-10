current_health -= other.damage;

var _i = irandom(array_length(sounds) - 1);

audio_play_sound(sounds[_i], 1, false, global.effect_volume);

instance_destroy(other);

if (current_health == 0) {
  effect_create_above(ef_explosion, x, y, 0.05, c_white);
  instance_destroy();
} else {
  // self healing timer
  alarm[0] = 120;
}
