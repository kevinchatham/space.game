var _enemy_respawn_count = max_enemy_count - instance_number(obj_enemy);

with (obj_space_camera) {
  spawn_at_random(
    obj_enemy,
    _enemy_respawn_count,
    other.min_distance_between_enemies,
    global.main_layer
  );
}
