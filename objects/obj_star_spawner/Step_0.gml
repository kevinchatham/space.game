var _x_min = obj_ship.x - obj_camera.view_width;
var _x_max = obj_ship.x + obj_camera.view_width;
var _y_min = obj_ship.y - obj_camera.view_height;
var _y_max = obj_ship.y + obj_camera.view_height;

with (obj_star) {
  var _outside_view_port = x < _x_min || x > _x_max || y < _y_min || y > _y_max;
  if (_outside_view_port) {
    instance_destroy();
    show_debug_message("Destroyed star at x: " + string(x) + ", y: " + string(y));
  }
}

var _respawn_count = max_stars - instance_number(obj_star);

for (var _i = 0; _i < _respawn_count; _i++) {
  var _x = random_range(_x_min, _x_max);
  var _y = random_range(_y_min, _y_max);

  var _new_star = instance_create_layer(_x, _y, global.background_layer, obj_star);

  if (_new_star != noone) {
    show_debug_message("Spawn star at x: " + string(_x) + ", y: " + string(_y));
  }
}
