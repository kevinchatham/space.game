// Set a padding value to ensure the object is created outside the room
min_distance_between = 100;
max_count = 100;

with (obj_space_camera) {
  spawn_at_random(
    obj_asteroid,
    other.max_count,
    other.min_distance_between,
    global.background_layer
  );
}
