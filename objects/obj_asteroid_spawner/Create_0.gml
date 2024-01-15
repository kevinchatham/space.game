// Set a padding value to ensure the object is created outside the room
min_distance_between = 350;
max_count = 12;

spawn_at_random(obj_star, max_count, min_distance_between, global.background_layer);

alarm[0] = global.despawn_lifetime;
