/// @description Destroy Rock

audio_play_sound(snd_collision, 1, false, global.volume);

// TODO FIX THE EXPLOSIONS
// NEED TO EASILY PLAY THE RIGHT EXPLOSION ANIMATION FOR A GIVEN ASTEROID
var _explosion_sprite_name = object_get_name(object_index) + "_explosion";

var _explosion_sprite_index = asset_get_index(_explosion_sprite_name);

instance_create_layer(x, y, global.main_layer, _explosion_sprite_index);

instance_destroy();
