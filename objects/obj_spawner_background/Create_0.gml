max_star_count = 1000;
max_planet_count = 20;
min_distance_between_planets = 500;
min_distance_between_stars = 20;

with (obj_space_camera) {
  spawn_at_random(
    obj_star,
    other.max_star_count,
    other.min_distance_between_stars,
    global.background_layer
  );
  spawn_at_random(
    obj_planet,
    other.max_planet_count,
    other.min_distance_between_planets,
    global.background_layer
  );
}
