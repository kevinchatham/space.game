/// @param {Id.Camera} _camera
/// @param {Real} _x
/// @param {Real} _y
/// @param {Real} [_padding=0] - Optional parameter with a default value of 0
function inside_view_port(_camera, _x, _y, _padding = 100) {
  var _lx = camera_get_view_x(_camera) - _padding;
  var _rx = camera_get_view_x(_camera) + view_get_wport(0) + _padding;
  var _ty = camera_get_view_y(_camera) - _padding;
  var _by = camera_get_view_y(_camera) + view_get_hport(0) + _padding;
  return point_in_rectangle(_x, _y, _lx, _ty, _rx, _by);
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
  var _rx = camera_get_view_x(_camera) + view_get_wport(0) * 3;
  var _ty = camera_get_view_y(_camera) - view_get_hport(0);
  var _by = camera_get_view_y(_camera) + view_get_hport(0) * 3;
  return point_in_rectangle(_x, _y, _lx, _ty, _rx, _by);
}

/// @param {Id.Camera} _camera
/// @param {Real} _x
/// @param {Real} _y
function outside_spawn_port(_camera, _x, _y) {
  return !inside_spawn_port(_camera, _x, _y);
}
