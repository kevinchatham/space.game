var _respawn_count = 1 - instance_number(obj_worm_hole); // 1 max

spawn_at_random(obj_worm_hole, _respawn_count, 0, global.main_layer);

alarm[0] = global.despawn_lifetime;
