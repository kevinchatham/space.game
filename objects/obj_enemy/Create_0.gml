max_speed = 0.75;
turn_speed = 0.05;
max_distance = 300;
acceleration = 0.01;
deceleration = 0.01;
state = "idle"; // attack // retreat

image_xscale = 0.5;
image_yscale = 0.5;

idle_manuvers = [pth_enemy_idle_0, pth_enemy_idle_1, pth_enemy_idle_2];

origin_x = x;
origin_y = y;

_i = irandom(array_length(idle_manuvers) - 1);
path_start(idle_manuvers[_i], max_speed, path_action_stop, false);
