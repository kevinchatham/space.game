/// @description Destroy Rocks

if (inside_view_port(obj_space_camera.camera, x, y) && inside_view_port(obj_space_camera.camera, other.x, other.y)) {
  audio_play_sound(snd_collision, 1, false, global.volume);
}

instance_destroy();
instance_destroy(other);
