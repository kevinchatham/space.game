var _star_respawn_count = max_star_count - instance_number(obj_star);
var _planet_respawn_count = max_planet_count - instance_number(obj_planet);

spawn_at_random(obj_star, _star_respawn_count, min_distance_between_stars, global.background_layer);
spawn_at_random(obj_planet, _planet_respawn_count, min_distance_between_planets, global.background_layer, 200);
