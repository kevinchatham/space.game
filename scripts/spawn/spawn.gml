/// @description Spawn any number of an object within the spawn port, outside of the view port.
/// @param {Asset.GMObject} _obj
/// @param {Real} _count
/// @param {Real} _padding
/// @param {String} _layer
function spawn_at_random(_obj, _count, _padding, _layer) {
  for (var _i = 0; _i < _count; _i++) {
    var _colliding = true;
    var _x = 0;
    var _y = 0;

var _c = 0;

    while (_colliding) {
		// TODO
		// SOMETIMES THE PROGRAM GETS CAUGHT IN THIS FUNCTION
		// I DON'T FULLY UNDERSTAND THE CIRCUMSTANCES
		// JUST SOMETIMES IT HAPPENS
		// THEN THE GAME FREEZES AND YOU HAVE TO FORCE QUIT :(
      _x = irandom_range(obj_space_camera.spawn_port_min_x, obj_space_camera.spawn_port_max_x);
      _y = irandom_range(obj_space_camera.spawn_port_min_y, obj_space_camera.spawn_port_max_y);
      _colliding =
        inside_view_port(obj_space_camera.camera, _x, _y) ||
        too_close(_x, _y, _obj, _padding) ||
        place_meeting(_x, _y, _obj);
		_c+=1;
		show_debug_message("colliding: " + string(_c));
    }

    var _new = instance_create_layer(_x, _y, _layer, _obj);
  }
}

function safely_despawn() {
  with (all) {
    if (!visible) continue;
    if (outside_spawn_port(obj_space_camera.camera, x, y)) {
      instance_destroy(id);
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
