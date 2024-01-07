/// @description Destroy Rock

audio_play_sound(sound_collision, 1, false, collision_volume);
effect_create_above(ef_explosion, x, y, collision_scale, c_white);

instance_destroy();
