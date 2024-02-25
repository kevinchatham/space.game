/// @description Declared in object variable definition. Used to initialize Item.
/// @type {String}
init_json = init_json;

/// @type {Struct.Item}
item = json_parse(init_json);

sprite_index = item.sprite;

rotation_speed = choose(1, -1) * 0.3;
motion_set(irandom(360), 0.1);
alarm[0] = irandom_range(60 * 5, 60 * 10);
