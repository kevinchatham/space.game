var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (item_drag != -1) {
  var _item = inventory_items[slot_drag];
  if ((_item = -1)) return;
  draw_set_alpha(0.5);
  draw_sprite(_item.sprite, 0, _mx, _my);
  draw_set_alpha(1);
}
