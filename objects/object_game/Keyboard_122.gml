/// @description Full Screen

if (window_get_fullscreen()) {
  window_set_fullscreen(false);
  window_set_size(room_width, room_height);
} else {
  window_set_fullscreen(true);
}
