// _camera = view_camera[0]

function inside_view_port(_camera, _x, _y) {
  var _lx = camera_get_view_x(_camera);
  var _rx = camera_get_view_x(_camera) + view_get_wport(0);
  var _ty = camera_get_view_y(_camera);
  var _by = camera_get_view_y(_camera) + view_get_hport(0);
  return point_in_rectangle(_x, _y, _lx, _ty, _rx, _by);
}

function outside_view_port(_camera, _x, _y) {
  return !inside_view_port(_camera, _x, _y);
}

function inside_spawn_port(_camera, _x, _y) {
  var _lx = camera_get_view_x(_camera) - view_get_wport(0);
  var _rx = camera_get_view_x(_camera) + view_get_wport(0) * 3;
  var _ty = camera_get_view_y(_camera) - view_get_hport(0);
  var _by = camera_get_view_y(_camera) + view_get_hport(0) * 3;
  return point_in_rectangle(_x, _y, _lx, _ty, _rx, _by);
}

function outside_spawn_port(_camera, _x, _y) {
  return !inside_spawn_port(_camera, _x, _y);
}
