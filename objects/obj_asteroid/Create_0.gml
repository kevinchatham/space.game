sprites = [spr_asteroid, spr_asteroid_ice];

index = irandom(array_length(sprites) - 1);

sprite_index = sprites[index];

initial_direction = random(360);
max_rotation_speed = 0.1;
min_rotation_speed = 0.01;
min_speed = 0.1;

// randomly choose to rotate left or right
rotation_speed = choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);

motion_set(initial_direction, min_speed);
