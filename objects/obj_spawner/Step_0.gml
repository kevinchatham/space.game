var _asteroid_respawn_count = max_asteroid_count - instance_number(obj_asteroid);
var _star_respawn_count = max_star_count - instance_number(obj_star);
var _planet_respawn_count = max_planet_count - instance_number(obj_planet);
var _enemy_respawn_count = max_enemy_count - instance_number(obj_enemy);
var _worm_hole_respawn_count = 1 - instance_number(obj_worm_hole); // 1 max

with (obj_space_camera) {
  spawn_at_random(
    obj_star,
    _star_respawn_count,
    other.min_star_distance_between,
    global.background_star_layer,
    0,
    other.allow_in_view_port
  );

  spawn_at_random(
    obj_planet,
    _planet_respawn_count,
    other.min_planet_distance_between,
    global.background_planet_layer,
    300,
    other.allow_in_view_port
  );

  spawn_at_random(
    obj_asteroid,
    _asteroid_respawn_count,
    other.min_asteroid_distance_between,
    global.main_layer,
    0,
    false
  );

  spawn_at_random(
    obj_enemy,
    _enemy_respawn_count,
    other.min_enemy_distance_between,
    global.main_layer,
    0,
    false
  );

  spawn_at_random(
    obj_worm_hole,
    _worm_hole_respawn_count,
    0,
    global.main_layer,
    0,
    other.allow_in_view_port
  );
}

allow_in_view_port = false;
