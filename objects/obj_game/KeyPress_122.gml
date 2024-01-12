/// @description Full Screen

if (window_get_fullscreen()) {
  window_set_fullscreen(false);
  window_set_size(obj_camera.scaled_width, obj_camera.scaled_height);
  camera_set_view_size(view_camera[0], room_width, room_height);
} else {
  window_set_fullscreen(true);
}
