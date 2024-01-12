// Padding around the room
var _padding = 5;

// Despawn stars outside the room
with (obj_star) {
  if (
    x < -_padding * 2 ||
    x > room_width + _padding * 2 ||
    y < -_padding * 2 ||
    y > room_height + _padding * 2
  ) {
    instance_destroy();
    show_debug_message(
      "Destroyed star at x: " + string(x) + ", y: " + string(y)
    );
  }
}

var _stars_to_respawn = max_stars - instance_number(obj_star);

for (var _i = 0; _i < _stars_to_respawn; _i++) {
   var _random_x;
   var _random_y;

   do {
    _random_x = random_range(-spawn_distance, room_width + spawn_distance);
    _random_y = random_range(-spawn_distance, room_height + spawn_distance);
  } until (!point_in_rectangle(_random_x, _random_y, 0, 0, room_width, room_height));

  var _new_star = instance_create_layer(
    _random_x,
    _random_y,
    obj_game.main_layer,
    obj_star
  );

  if (_new_star != noone) {
    show_debug_message("Created star at x: " + string(_random_x) + ", y: " + string(_random_y));
  }
}
