max_enemy_count = 50;
min_distance_between_enemies = 20;

with (obj_space_camera) {
  spawn_at_random(
    obj_star,
    other.max_enemy_count,
    other.min_distance_between_enemies,
    global.background_layer
  );
}
