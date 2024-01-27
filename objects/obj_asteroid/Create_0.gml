asteroid = create_random_asteroid();
max_health = asteroid.max_health;
playing_sound = false; // prevents sound from playing multiple times during collision.
sprite_index = asteroid.sprite_index;
motion_set(asteroid.initial_direction, asteroid.min_speed);
// healing interval
alarm[0] = 120;
