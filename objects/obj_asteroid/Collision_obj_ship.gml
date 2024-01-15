/// @description Destroy Rock

audio_play_sound(snd_collision, 1, false, global.volume);

instance_create_layer(x, y, global.main_layer, obj_asteroid_explosion);

instance_destroy();
