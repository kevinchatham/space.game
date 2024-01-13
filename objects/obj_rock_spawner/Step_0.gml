function too_close_to_other_rocks(_x, _y) {
  var _rock = instance_nearest(_x, _y, obj_rock);

  if (_rock == noone) return false;

  if (point_distance(_x, _y, _rock.x, _rock.y) < min_distance_between_rocks) {
    return true; // Too close to another rock
  }

  return false; // Safe distance
}

with (obj_rock) {
  if (outside_spawn_port(obj_space_camera.camera, x, y)) {
    instance_destroy();
    show_debug_message("Destroyed rock at x: " + string(x) + ", y: " + string(y));
  }
}

var _respawn_count = max_rocks - instance_number(obj_rock);

for (var _i = 0; _i < _respawn_count; _i++) {
  var _x = obj_ship.x;
  var _y = obj_ship.y;

  // Check if the initial random position is occupied
  while (inside_view_port(obj_space_camera.camera, _x, _y) || too_close_to_other_rocks(_x, _y)) {
    _x = random_range(obj_space_camera.spawn_port_min_x, obj_space_camera.spawn_port_max_x);
    _y = random_range(obj_space_camera.spawn_port_min_y, obj_space_camera.spawn_port_max_y);
  }

  var _new_rock = instance_create_layer(_x, _y, global.main_layer, obj_rock);

  if (_new_rock != noone) {
    show_debug_message("Spawned rock at x: " + string(_x) + ", y: " + string(_y));
  }
}
