/// @description Bullet Collision

var _i = irandom(array_length(sounds) - 1);

if (inside_view_port(obj_space_camera.camera, x, y)) {
  audio_play_sound(sounds[_i], 1, false, global.effect_volume);
}

asteroid.max_health -= other.damage;

instance_destroy(other);

if (asteroid.max_health <= 0 && sprite_index != asteroid.animation_sprite_index) {
  sprite_index = asteroid.animation_sprite_index;
}
