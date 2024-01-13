max_stars = 100;

var _x_min = obj_ship.x - obj_camera.view_width;
var _x_max = obj_ship.x + obj_camera.view_width;
var _y_min = obj_ship.y - obj_camera.view_height;
var _y_max = obj_ship.y + obj_camera.view_height;

for (var _i = 0; _i < max_stars; _i++) {
  var _x = random_range(_x_min, _x_max);
  var _y = random_range(_y_min, _y_max);
  instance_create_layer(_x, _y, global.background_layer, obj_star);
}
