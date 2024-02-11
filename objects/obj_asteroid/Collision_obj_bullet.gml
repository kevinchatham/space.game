/// @description Bullet Collision

var _i = irandom(array_length(sounds) - 1);

if (obj_space_camera.inside_view_port(x, y)) {
  audio_play_sound(sounds[_i], 1, false, global.effect_volume);
}

asteroid.current_health -= other.damage;

instance_destroy(other);

if (asteroid.current_health <= 0 && sprite_index != asteroid.animation_sprite_index) {
  sprite_index = asteroid.animation_sprite_index;
}
