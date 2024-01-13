min_rotation_speed = 0.1;
max_rotation_speed = 1;

// randomly choose to rotate left or right
rotation_speed =
  choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);

scale = random_range(0.1, 0.25);

image_xscale = scale;
image_yscale = scale;
image_alpha = 0;
