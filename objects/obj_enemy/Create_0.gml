image_xscale = 0.4;
image_yscale = image_xscale;

// a higher value smooths boid rotation on direction change
angular_offset = 5;

// boid speeds
speed_max = 0.5;
speed_min = 0.3;
turn_speed = 0.5;

// padding around other boids or obstacles before action is taken
attack_radius = 100;
enemy_radius = 25;
friend_radius = 50;
obstacle_radius = 10;
retreat_angular_threshold = 45;
retreat_radius = attack_radius / 2;

// how quickly boid should turn to avoid / align obstacles or other boids
attack_weight = 3;
enemy_avoidance_weight = 2;
friend_alignment_weight = 1;
friend_center_weight = 1;
obstacle_avoidance_weight = 3;
retreat_weight = 3;

// in your game this would be the dimensions of the spawn port padded by a certain amount
area_x1 = obj_space_camera.spawn_port_min_x + 50;
area_y1 = obj_space_camera.spawn_port_min_y + 50;
area_x2 = obj_space_camera.spawn_port_max_x - 50;
area_y2 = obj_space_camera.spawn_port_max_y - 50;

// adds some sin noise to the enemy ship movement
noise_direction = choose(-1, 1); // controls left or right in sin wave
noise_elapsed = 0;
noise_elapsed_max = 600; // prevents this value from becoming to large and adversly effecting movement as opposed to current_time
noise_frequency = 50000;
noise_magnitude = 30;

speed = random_range(speed_min, speed_max);
direction = irandom(360);
image_angle = direction;

max_health = irandom_range(5, 10);
current_health = max_health;
can_shoot = true;

sounds = [snd_asteroid_hit_0, snd_asteroid_hit_1, snd_asteroid_hit_2, snd_asteroid_hit_3, snd_asteroid_hit_4];

/// @arg {Real} _new_angle
/// @arg {Real} _change_speed
/// @arg {Real} _angular_threshold
function change_direction(_new_angle, _change_speed, _angular_threshold) {
  var _ang_dif = angle_difference(direction, _new_angle);

  if (_ang_dif > _angular_threshold) {
    direction -= _change_speed;
  } else if (_ang_dif < _angular_threshold) {
    direction += _change_speed;
  }
}
