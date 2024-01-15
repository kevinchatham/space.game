var _respawn_count = max_count - instance_number(obj_asteroid);

spawn_at_random(obj_asteroid, _respawn_count, min_distance_between, global.main_layer);
