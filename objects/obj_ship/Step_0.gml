var _up = keyboard_check(ord("W"));
var _left = keyboard_check(ord("A"));
var _down = keyboard_check(ord("S"));
var _right = keyboard_check(ord("D"));
var _shoot = mouse_check_button(mb_left);

// ! Movement
if (_up) {
  if (speed < max_speed) {
    motion_add(image_angle, acceleration);
  } else {
    speed -= deceleration;
  }
}

if (_down) {
  if (speed > min_speed) {
    speed -= deceleration;
  } else {
    motion_set(direction, min_speed);
  }
}

if (_right && keyboard_controlled) {
  image_angle -= turn_speed;
  motion_set(image_angle, speed);
}

if (_left && keyboard_controlled) {
  image_angle += turn_speed;
  motion_set(image_angle, speed);
}

if (_shoot && can_shoot) {
  audio_play_sound(snd_blaster, 1, false, global.effect_volume);
  instance_create_layer(
    x,
    y,
    global.main_layer,
    obj_bullet,
    {image_angle: image_angle, image_xscale: 0.25, image_yscale: 0.25}
  );
  can_shoot = false;
  alarm[1] = round(60 / fire_rate);
}

// This allows the ship to smoothly follow the mouse cursor.
// There is a deadzone so the ship doesn't wiggle when pointing directly at the cursor.
if (!keyboard_controlled) {
  var _dead_zone = 5;

  var _target_angle = point_direction(x, y, mouse_x, mouse_y) + 180;
  var _diff = angle_difference(image_angle, _target_angle);

  var _can_turn = abs(_diff) + _dead_zone < 180 || abs(_diff) - _dead_zone > 180;
  var _turning_left = _diff > 0;
  var _turning_right = !_turning_left;

  if (_can_turn) {
    if (_turning_left) {
      image_angle += turn_speed;
      motion_set(image_angle, speed);
    } else if (_turning_right) {
      image_angle -= turn_speed;
      motion_set(image_angle, speed);
    }
  }
}

if (keyboard_controlled) {
  window_set_cursor(cr_none);
  cursor_sprite = spr_none;
} else {
  window_set_cursor(cr_none);
  cursor_sprite = spr_cursor;
}

// ! Particles
// Calculate the offset from the ship's center to the bottom center with horizontal adjustment
offset_x = lengthdir_x(sprite_width / 2 + base_offset, image_angle);
offset_y = lengthdir_y(sprite_height / 2 + base_offset, image_angle);

// Calculate the coordinates of the center of the circle
center_x = x - offset_x;
center_y = y - offset_y;

// Calculate bounding box of the circle
emitter_left = center_x - emitter_radius;
emitter_right = center_x + emitter_radius;
emitter_top = center_y - emitter_radius;
emitter_bottom = center_y + emitter_radius;

part_type_direction(
  global.thruster_particle_type,
  image_angle + 180,
  image_angle + 180,
  0,
  0
);

part_emitter_region(
  global.particle_system,
  global.thruster_particle_emitter,
  emitter_left,
  emitter_right,
  emitter_top,
  emitter_bottom,
  ps_shape_ellipse,
  ps_distr_linear
);

// Smoothly transition alpha value based on speed
if (speed > min_speed) {
  part_type_speed(global.thruster_particle_type, min_speed, speed, acceleration, 0);
  target_alpha = lerp(min_alpha, max_alpha, speed / max_speed);
} else {
  part_type_speed(global.thruster_particle_type, 0, 0, acceleration, 0);
  target_alpha = 0; // Fully transparent
}

// Adjust alpha gradually using lerp
current_alpha = lerp(current_alpha, target_alpha, lerp_speed);
part_type_alpha3(global.thruster_particle_type, current_alpha, min_alpha, 0);
