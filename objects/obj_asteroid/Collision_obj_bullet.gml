if (inside_view_port(obj_space_camera.camera, x, y)) {
  audio_play_sound(snd_collision, 1, false, global.volume);
}

asteroid.max_health -= other.damage;

instance_destroy(other);

if (asteroid.max_health <= 0 && sprite_index != asteroid.animation_sprite_index) {
  sprite_index = asteroid.animation_sprite_index;
}
