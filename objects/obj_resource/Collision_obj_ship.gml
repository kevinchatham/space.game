audio_play_sound(snd_pickup, 1, false, global.effect_volume / 3);
var _item = new InventoryItem(sprite_get_name(sprite_index), 1, sprite_index);
obj_ship_inventory.inventory.item_add(_item);
instance_destroy();
