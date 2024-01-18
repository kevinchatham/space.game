/// @description Keyboard Control
keyboard_controlled = !keyboard_controlled;

if (keyboard_controlled) {
  window_set_cursor(cr_none);
  cursor_sprite = cr_none;
} else {
  window_set_cursor(cr_none);
  cursor_sprite = spr_cursor;
}
