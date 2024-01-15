max_star_count = 1000;
max_planet_count = 20;
min_distance_between_planets = 500;
min_distance_between_stars = 20;

spawn_at_random(obj_star, max_star_count, min_distance_between_stars, global.background_layer);
spawn_at_random(obj_planet, max_planet_count, min_distance_between_planets, global.background_layer);

alarm[0] = global.despawn_lifetime;
