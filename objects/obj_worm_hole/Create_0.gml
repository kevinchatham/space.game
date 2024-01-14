initial_direction = random(360);
rotation_speed = 1;
min_speed = 0.1;
min_image_scale = 2;
max_image_scale = 3;
scale_rate = 0.02;

motion_set(initial_direction, min_speed);

image_xscale = min_image_scale;
image_yscale = min_image_scale;
