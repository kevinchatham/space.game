acceleration = 0.001;
deceleration = 0.01;
max_speed = 0.25;
min_speed = 0.1;
min_rotation_speed = 0.1;
max_rotation_speed = 1;

// randomly choose to rotate left or right
rotation_speed =
  choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);

image_xscale = random_range(0.1, 1);
image_yscale = random_range(0.1, 1);
