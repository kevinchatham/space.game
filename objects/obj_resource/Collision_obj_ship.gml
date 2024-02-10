audio_play_sound(snd_pickup, 1, false, global.effect_volume / 3);
obj_ship_inventory.inventory.item_add(sprite_get_name(sprite_index), 1, sprite_index);
instance_destroy();
