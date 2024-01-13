/// @description Full Screen

if (window_get_fullscreen()) {
  window_set_fullscreen(false);
  window_set_size(obj_space_camera.scaled_view_width, obj_space_camera.scaled_view_height);
  camera_set_view_size(obj_space_camera.camera, room_width, room_height);
} else {
  window_set_fullscreen(true);
}
