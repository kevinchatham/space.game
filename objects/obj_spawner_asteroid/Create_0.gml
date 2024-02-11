min_distance_between = 100;
max_count = 100;

with (obj_space_camera) {
  spawn_inside_view_port(
    obj_asteroid,
    other.max_count / 10,
    other.min_distance_between,
    global.main_layer
  );
}
