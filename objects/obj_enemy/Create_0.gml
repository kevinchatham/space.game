max_health = irandom_range(10, 20);
current_health = max_health;
can_shoot = true;

attack_radius = 200;
max_speed = 1;
turn_speed = 0.1;
acceleration = 0.01;
deceleration = 0.01;
state = "idle"; // attack // retreat

image_xscale = 0.5;
image_yscale = 0.5;

idle_manuvers = [pth_enemy_idle_0, pth_enemy_idle_1, pth_enemy_idle_2];

origin_x = x;
origin_y = y;

sounds = [snd_asteroid_hit_0, snd_asteroid_hit_1, snd_asteroid_hit_2, snd_asteroid_hit_3, snd_asteroid_hit_4];
