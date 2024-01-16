acceleration = 0.01;
deceleration = 0.01;
min_speed = 0.1;
max_speed = 1;
target_angle= 0;
rotation_speed = 1;

// updated by Step event
// shared with Draw event
base_angle = 0;
offset_x = 0;
offset_y = 0;
center_x = 0;
center_y = 0;
emitter_left = 0;
emitter_right = 0;
emitter_top = 0;
emitter_bottom = 0;

// Particles
min_alpha = 0.1;
max_alpha = 0.7;
current_alpha = min_alpha; // Initial alpha value (adjust as needed)
target_alpha = 0; // Target alpha value
lerp_speed = 0.05; // Adjust the speed of the transition
emitter_radius = 4;
base_offset = 0;
