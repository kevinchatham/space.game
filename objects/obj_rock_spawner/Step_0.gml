// Checks if rock is too close to other rocks
function too_close_to_other_rocks(x, y) {
    var _rocks = instance_nearest(x, y, obj_rock);

	if(_rocks == noone) return false;

    if (point_distance(x, y, _rocks.x, _rocks.y) < min_distance_between_rocks) {
        return true; // Too close to another rock
    }

    return false; // Safe distance
}

var _number_of_rocks = instance_number(obj_rock);

if (_number_of_rocks >= max_rock_count) return;

// Generate initial random coordinates outside the room
var _random_x;
var _random_y;

do {
  _random_x = random_range(-spawn_distance, room_width + spawn_distance);
  _random_y = random_range(-spawn_distance, room_height + spawn_distance);
} until (!point_in_rectangle(_random_x, _random_y, 0, 0, room_width, room_height));

// Check if the initial random position is occupied
while (position_meeting(_random_x, _random_y, obj_rock) || too_close_to_other_rocks(_random_x, _random_y)) {
    _random_x = random_range(-spawn_distance, room_width + spawn_distance);
    _random_y = random_range(-spawn_distance, room_height + spawn_distance);
}

var _new_rock = instance_create_layer(
  _random_x,
  _random_y,
  obj_game.main_layer,
  obj_rock
);

if (_new_rock != noone) {
  show_debug_message("Created rock at x: " + string(_random_x) + ", y: " + string(_random_y));
}
