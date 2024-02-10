/// @description Mouse Wheel Up

var _scale = window_scale + 0.1;

if (_scale > min_window_scale) {
  return;
}

refresh_view_port(_scale);
