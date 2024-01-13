if (inside_view_port(view_camera[0], x, y)) {
  audio_play_sound(snd_collision, 1, false, collision_volume);
  effect_create_depth(-15000, ef_explosion, x, y, collision_scale, c_white);
}

instance_destroy();
