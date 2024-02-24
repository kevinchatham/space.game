audio_play_sound(snd_pickup, 1, false, global.effect_volume / 3);
var _item = new InventoryItem("DISPLAYNAME",sprite_index, 1);
obj_ship_inventory.inventory.inventory_add(_item);
instance_destroy();
