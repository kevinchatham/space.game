/// @description Destroy Rock

audio_play_sound(snd_collision, 1, false, collision_volume);
effect_create_depth(-15000, ef_explosion, x, y, collision_scale, c_white);

instance_create_layer(x, y, global.main_layer, obj_asteroid_explosion);
instance_destroy();
