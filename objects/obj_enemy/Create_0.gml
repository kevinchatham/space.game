image_xscale = 0.3;
image_yscale = image_xscale;

// a higher value smooths boid rotation on direction change
angular_offset = 3;

// boid speeds
turn_speed = 1;
speed_min = 0.5;
speed_max = 1;

// padding around other boids or obstacles before action is taken
enemy_padding = 50;
friend_padding = 100;
obstacle_padding = 25;
attack_padding = 150;
retreat_padding = attack_padding / 2;

// how quickly boid should avoid / align obstacles or other boids
obstacle_avoidance_weight = 3;
enemy_avoidance_weight = 2;
friend_alignment_weight = 1;
friend_center_weight = 1;
attack_weight = 2;
retreat_weight = 2;

// in your game this would be the dimensions of the spawn port padded by a certain amount
area_x1 = obj_space_camera.spawn_port_min_x + 50;
area_y1 = obj_space_camera.spawn_port_min_y + 50;
area_x2 = obj_space_camera.spawn_port_max_x - 50;
area_y2 = obj_space_camera.spawn_port_max_y - 50;

speed = irandom_range(speed_min, speed_max);
direction = irandom(360);
image_angle = direction;

max_health = irandom_range(100, 200);
current_health = max_health;
can_shoot = true;

sounds = [snd_asteroid_hit_0, snd_asteroid_hit_1, snd_asteroid_hit_2, snd_asteroid_hit_3, snd_asteroid_hit_4];
