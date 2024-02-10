var _enemy_respawn_count = max_enemy_count - instance_number(obj_enemy);

spawn_at_random(obj_enemy, _enemy_respawn_count, min_distance_between_enemies, global.main_layer);
