sounds = [
  snd_asteroid_hit_0,
  snd_asteroid_hit_1,
  snd_asteroid_hit_2,
  snd_asteroid_hit_3,
  snd_asteroid_hit_4
];

asteroid = create_random_asteroid();
damage = 10;
playing_sound = false; // prevents sound from playing multiple times during collision.
sprite_index = asteroid.sprite_index;
image_speed = 0;
motion_set(asteroid.initial_direction, asteroid.min_speed);
// healing interval
alarm[0] = 120;
