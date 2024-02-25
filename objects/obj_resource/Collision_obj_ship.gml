audio_play_sound(snd_pickup, 1, false, global.effect_volume / 3);
obj_ship_inventory.inventory.inventory_add(item, 1);
instance_destroy();
