/// @description Mouse Wheel Down

var _scale = window_scale - 0.1;

if (_scale < max_window_scale) {
  return;
}

refresh_view_port(_scale);
