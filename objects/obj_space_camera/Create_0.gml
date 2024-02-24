draw_port_padding = 5;
draw_view_port = false;
draw_particle_emitter_regions = false;

camera = view_camera[0];
camera_speed = 0.01;
default_view_height = display_get_height() - 200;
default_view_width = default_view_height * 1.6;
min_window_scale = 4; // higher is zoomed in
max_window_scale = 2; // lower is zoomed out
spawn_port_scale = 3;

// these are updated dynamically
window_scale = 0;
view_width = 0;
view_height = 0;
scaled_view_width = 0;
scaled_view_height = 0;
view_port_min_x = 0;
view_port_max_x = 0;
view_port_min_y = 0;
view_port_max_y = 0;
spawn_port_min_x = 0;
spawn_port_max_x = 0;
spawn_port_min_y = 0;
spawn_port_max_y = 0;
alpha = 0;
//

refresh_view_port(max_window_scale, false, true);

// despawn items outside of camera / spawn port
alarm[1] = global.despawn_lifetime;

fade_duration = 60 * 4;
fade_timer = fade_duration;

/// @param {Real} _scale
/// @param {Bool} _pan
/// @param {Bool} _center
function refresh_view_port(_scale, _pan = false, _center = false) {
  window_scale = _scale;
  view_width = default_view_width / _scale;
  view_height = default_view_height / _scale;
  scaled_view_width = view_width * window_scale;
  scaled_view_height = view_height * window_scale;

  // needs to be in this order
  // window size -> alarm window center -> surface resize -> set camera pos
  window_set_size(scaled_view_width, scaled_view_height);
  if (_center) {
    alarm[0] = 1;
  }
  surface_resize(application_surface, scaled_view_width, scaled_view_height);

  if (_pan) {
    camera_set_view_pos(camera, obj_ship.x, obj_ship.y);
  } else {
    camera_set_view_pos(camera, obj_ship.x - view_width / 2, obj_ship.y - view_height / 2);
  }

  // these are updated every end step
  view_port_min_x = camera_get_view_x(camera);
  view_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera);
  view_port_min_y = camera_get_view_y(camera);
  view_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera);

  spawn_port_min_x = camera_get_view_x(camera) - camera_get_view_width(camera);
  spawn_port_max_x = camera_get_view_x(camera) + camera_get_view_width(camera) * spawn_port_scale;
  spawn_port_min_y = camera_get_view_y(camera) - camera_get_view_height(camera);
  spawn_port_max_y = camera_get_view_y(camera) + camera_get_view_height(camera) * spawn_port_scale;
}

/// @description Spawn any number of an object within the spawn port, outside of the view port.
/// @param {Asset.GMObject} _obj
/// @param {Real} _count
/// @param {Real} _object_padding
/// @param {Id.Layer} _layer
function spawn_inside_view_port(_obj, _count, _object_padding, _layer) {
  for (var _i = 0; _i < _count; _i++) {
    var _colliding = true;
    var _x = 0;
    var _y = 0;
    var _c = 0;

    while (_colliding) {
      _x = irandom_range(view_port_min_x, view_port_max_x);
      _y = irandom_range(view_port_min_y, view_port_max_y);
      _colliding = too_close(_x, _y, _obj, _object_padding) || too_close(_x, _y, obj_ship, 100);
      if (_c > 500) {
        _colliding = false;
        log("Spawn limit reached on", object_get_name(_obj));
      }
      _c++;
    }

    var _new = instance_create_layer(_x, _y, _layer, _obj);
  }
}

/// @description Spawn any number of an object within the spawn port, outside of the view port.
/// @param {Asset.GMObject} _obj
/// @param {Real} _count
/// @param {Real} _object_padding
/// @param {Id.Layer} _layer
/// @param {Real} [_view_port_padding]
/// @param {Bool} [_allow_in_view_port]
function spawn_at_random(
  _obj,
  _count,
  _object_padding,
  _layer,
  _view_port_padding = 100,
  _allow_in_view_port = false
) {
  for (var _i = 0; _i < _count; _i++) {
    var _colliding = true;
    var _x = 0;
    var _y = 0;
    var _c = 0;

    while (_colliding) {
      _x = irandom_range(spawn_port_min_x, spawn_port_max_x);
      _y = irandom_range(spawn_port_min_y, spawn_port_max_y);

      if (_allow_in_view_port) {
        _colliding = too_close(_x, _y, _obj, _object_padding);
      } else {
        _colliding =
          inside_view_port(_x, _y, _view_port_padding) || too_close(_x, _y, _obj, _object_padding);
      }

      if (_c == 500) {
        log("Spawn limit reached on", object_get_name(_obj));
        return;
      }
      _c++;
    }

    var _new = instance_create_layer(_x, _y, _layer, _obj);
  }
}

function safely_despawn() {
  var _destroyable = [
    obj_asteroid,
    obj_bullet,
    obj_enemy,
    obj_planet,
    obj_resource,
    obj_star,
    obj_worm_hole
  ];

  for (var _i = 0; _i < array_length(_destroyable) - 1; _i++) {
    with (_destroyable[_i]) {
      if (other.outside_spawn_port(x, y)) {
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

/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} [_padding]
function inside_view_port(_x, _y, _padding = 100) {
  return point_in_rectangle(
    _x,
    _y,
    view_port_min_x - _padding,
    view_port_min_y - _padding,
    view_port_max_x + _padding,
    view_port_max_y + _padding
  );
}

/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} _padding
function outside_view_port(_x, _y, _padding) {
  return !inside_view_port(_x, _y, _padding);
}

/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} _padding
function inside_spawn_port(_x, _y, _padding = 100) {
  return point_in_rectangle(
    _x,
    _y,
    spawn_port_min_x - _padding,
    spawn_port_min_y - _padding,
    spawn_port_max_x + _padding,
    spawn_port_max_y + _padding
  );
}

/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} [_padding]
function outside_spawn_port(_x, _y, _padding = 0) {
  return !inside_spawn_port(_x, _y, _padding);
}
