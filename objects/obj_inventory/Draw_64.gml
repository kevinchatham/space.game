if (!is_visible) {
  return;
}

display_set_gui_maximize();
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// draw inventory box
draw_sprite_stretched(
  spr_inventory_box,
  0,
  window_padding_x,
  window_padding_y,
  inventory_width,
  inventory_height
);

for (var _row = 0; _row < rows; _row++) {
  for (var _column = 0; _column < columns; _column++) {
    var _this_index = _row * columns + _column;
    var _this = inventory.find(_this_index);

    var _x_min =
      window_padding_x
      + sprite_padding_x
      + (slot_sprite_w + sprite_padding_x) * _column;
    var _y_min =
      window_padding_y
      + sprite_padding_y
      + (slot_sprite_h + sprite_padding_y) * _row;
    var _x_max = _x_min + slot_sprite_w;
    var _y_max = _y_min + slot_sprite_h;
    var _x_center = _x_min + slot_sprite_w / 2;
    var _y_center = _y_min + slot_sprite_h / 2;
    var _counter_radius = slot_sprite_w / 3;

    var _is_hovering = is_within(_mx, _my, _x_min, _x_max, _y_min, _y_max);

    // draw inventory slots
    draw_sprite(spr_inventory_slot, 0, _x_min, _y_min);
    // draw inventory sprite
    draw_sprite(_this.item.sprite, 0, _x_center, _y_center);

    if (_this.quantity == 0) {
      continue;
    }

    // draw counter / text
    draw_set(c_black, 1);
    draw_circle(_x_max, _y_max, _counter_radius, false);
    text_align(fa_center, fa_middle);
    draw_set_font(fnt_default);
    draw_set(c_white, 1);
    draw_text(_x_max, _y_max, _this.quantity);

    if (!_is_hovering) {
      continue;
    }

    // draw highlight inventory slot
    draw_set(c_gray, 0.1);
    draw_roundrect_ext(
      _x_min,
      _y_min,
      _x_max,
      _y_max,
      _counter_radius,
      _counter_radius,
      false
    );
    draw_circle(_x_max, _y_max, _counter_radius, false);
    draw_reset();
  }
}

if (item_drag == undefined || slot_drag_index == -1) {
  return;
}

// draw item player is dragging
var _selected_item = inventory.find(slot_drag_index);
draw_set_alpha(0.5);
draw_roundrect_color(
  _mx - slot_sprite_w / 2,
  _my - slot_sprite_h / 2,
  _mx + slot_sprite_w / 2,
  _my + slot_sprite_h / 2,
  c_white,
  c_white,
  false
);
draw_sprite(_selected_item.item.sprite, 0, _mx, _my);

draw_reset();
