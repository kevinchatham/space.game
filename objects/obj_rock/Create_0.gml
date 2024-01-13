initial_direction = random(360);
max_rotation_speed = 0.1;
min_rotation_speed = 0.01;
min_speed = 0.1;
collision_volume = 0.25;
collision_scale = 0.9;

// randomly choose to rotate left or right
rotation_speed =
  choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);

motion_set(initial_direction, min_speed);
