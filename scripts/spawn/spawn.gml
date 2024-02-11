/// @description Spawn any number of an object within the spawn port, outside of the view port.
/// @param {Asset.GMObject} _obj
/// @param {Real} _count
/// @param {Real} _object_padding
/// @param {String} _layer
/// @param {Real} _view_port_padding
function spawn_at_random(_obj, _count, _object_padding, _layer, _view_port_padding = 0) {
  for (var _i = 0; _i < _count; _i++) {
    var _colliding = true;
    var _x = 0;
    var _y = 0;
    var _c = 0;

    while (_colliding) {
      _x = irandom_range(obj_space_camera.spawn_port_min_x, obj_space_camera.spawn_port_max_x);
      _y = irandom_range(obj_space_camera.spawn_port_min_y, obj_space_camera.spawn_port_max_y);
      _colliding =
        inside_view_port(obj_space_camera.camera, _x, _y, _view_port_padding) ||
        too_close(_x, _y, _obj, _object_padding);
      if (_c > 500) {
        _colliding = false;
        log("spawn limit reached on", object_get_name(_obj));
      }
      _c++;
    }

    var _new = instance_create_layer(_x, _y, _layer, _obj);
  }
}

function safely_despawn() {
  var _destroyable = [obj_asteroid, obj_bullet, obj_enemy, obj_planet, obj_resource, obj_star, obj_worm_hole];

  for (var _i = 0; _i < array_length(_destroyable) - 1; _i++) {
    with (_destroyable[_i]) {
      if (outside_spawn_port(obj_space_camera.camera, x, y)) {
        instance_destroy(id);
      }
    }
  }
}

/// @param {Real} _x
/// @param {Real} _y
/// @param {Asset.GMObject} _obj
/// @param {Real} _padding
function too_close(_x, _y, _obj, _padding) {
  var _closest = instance_nearest(_x, _y, _obj);

  if (_closest == noone) return false;

  if (point_distance(_x, _y, _closest.x, _closest.y) <= _padding) {
    return true;
  }

  return false;
}

/// @param {Id.Camera} _camera
/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} [_padding] - Optional parameter with a default value of 0
function inside_view_port(_camera, _x, _y, _padding = 100) {
  return point_in_rectangle(
    _x,
    _y,
    obj_space_camera.view_port_min_x - _padding,
    obj_space_camera.view_port_min_y - _padding,
    obj_space_camera.view_port_max_x + _padding,
    obj_space_camera.view_port_max_y + _padding
  );
}

/// @param {Id.Camera} _camera
/// @param {Real} _x
/// @param {Real} _y
function outside_view_port(_camera, _x, _y) {
  return !inside_view_port(_camera, _x, _y);
}

/// @param {Id.Camera} _camera
/// @param {Real} _x
/// @param {Real} _y
function inside_spawn_port(_camera, _x, _y) {
  var _lx = camera_get_view_x(_camera) - view_get_wport(0);
  var _rx = camera_get_view_x(_camera) + view_get_wport(0) * obj_space_camera.spawn_port_scale;
  var _ty = camera_get_view_y(_camera) - view_get_hport(0);
  var _by = camera_get_view_y(_camera) + view_get_hport(0) * obj_space_camera.spawn_port_scale;
  return point_in_rectangle(_x, _y, _lx, _ty, _rx, _by);
}

/// @param {Id.Camera} _camera
/// @param {Real} _x
/// @param {Real} _y
function outside_spawn_port(_camera, _x, _y) {
  return !inside_spawn_port(_camera, _x, _y);
}
