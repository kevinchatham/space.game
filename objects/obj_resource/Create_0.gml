/// @type {Struct.Item|Undefined}
item = item;

sprite_index = item.sprite;

rotation_speed = choose(1, -1) * 0.3;
motion_set(irandom(360), 0.1);
alarm[0] = irandom_range(60 * 5, 60 * 10);
