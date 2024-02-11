var _respawn_count = max_count - instance_number(obj_asteroid);

with (obj_space_camera) {
  spawn_at_random(obj_asteroid, _respawn_count, other.min_distance_between, global.main_layer);
}
