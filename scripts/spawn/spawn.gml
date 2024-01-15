// spawn any number of an object within the spawn port, outside of the view port
function spawn_at_random(_obj, _count, _padding, _layer) {
  for (var _i = 0; _i < _count; _i++) {
    var _colliding = true;
    var _x = 0;
    var _y = 0;

    while (_colliding) {
      _x = irandom_range(obj_space_camera.spawn_port_min_x, obj_space_camera.spawn_port_max_x);
      _y = irandom_range(obj_space_camera.spawn_port_min_y, obj_space_camera.spawn_port_max_y);
      _colliding =
        inside_view_port(obj_space_camera.camera, _x, _y) ||
        place_meeting(_x, _y, _obj) ||
        too_close(_x, _y, _obj, _padding);
    }

    var _new = instance_create_layer(_x, _y, _layer, _obj);

    if (_new != noone) {
      show_debug_message("Spawned " + object_get_name(_obj) + " x: " + string(_new.x) + ", y: " + string(_new.y));
    }
  }
}

function safely_despawn(_obj) {
  with (_obj) {
    if (outside_spawn_port(obj_space_camera.camera, x, y)) {
      show_debug_message("Despawned " + object_get_name(_obj) + " x: " + string(x) + ", y: " + string(y));
      instance_destroy(id);
    }
  }
}

function too_close(_x, _y, _obj, _padding) {
  var _closest = instance_nearest(_x, _y, _obj);

  if (_closest == noone) return false;

  if (point_distance(_x, _y, _closest.x, _closest.y) <= _padding) {
    return true;
  }

  return false;
}
