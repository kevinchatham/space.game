max_enemy_count = 50;
min_distance_between_enemies = 20;

with (obj_space_camera) {
  spawn_inside_view_port(
    obj_planet,
    other.max_enemy_count / 10,
    other.min_distance_between_enemies,
    global.main_layer
  );
}
