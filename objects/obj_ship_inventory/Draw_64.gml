display_set_gui_maximise();

if (is_visible) {
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

  for (var _row = 0; _row < inventory_rows; _row++) {
    for (var _column = 0; _column < inventory_columns; _column++) {
      // draw inventory slots
      var _pos_x = initial_padding_x + (slot_sprite_w + sprite_padding_x) * _column;
      var _pos_y = initial_padding_y + (slot_sprite_h + sprite_padding_y) * _row;
      draw_sprite(spr_inventory_slot, 0, _pos_x, _pos_y);

      // draw inventory sprite
      var _inventory_index = _row * inventory_columns + _column;
      if (_inventory_index <= array_length(inventory.inventory_list()) - 1) {
        var _item_pos_x = _pos_x + slot_sprite_w / 2;
        var _item_pos_y = _pos_y + slot_sprite_h / 2;
        draw_sprite(
          inventory.inventory_list()[_inventory_index].item.sprite,
          0,
          _item_pos_x,
          _item_pos_y
        );

        // draw counter / text
        var _counter_position_x = _pos_x + slot_sprite_w;
        var _counter_position_y = _pos_y + slot_sprite_h;
        var _counter_radius = slot_sprite_w / 3;
        // if the inventory slot quantity is 0 that means it's empty and we don't want to highlight it
        if (inventory.inventory_list()[_inventory_index].quantity != 0) {
          draw_set(c_black, 1);
          draw_circle(_counter_position_x, _counter_position_y, _counter_radius, false);
          text_align(fa_center, fa_middle);
          draw_set_font(fnt_default);
          draw_set(c_white, 1);
          draw_text(
            _counter_position_x,
            _counter_position_y,
            inventory.inventory_list()[_inventory_index].quantity
          );

          // highlight inventory slot if hovering
          if (is_between(_mx, _pos_x, _pos_x + slot_sprite_w)) {
            if (is_between(_my, _pos_y, _pos_y + slot_sprite_h)) {
              draw_set(c_gray, 0.1);
              draw_roundrect_ext(
                _pos_x,
                _pos_y,
                _pos_x + slot_sprite_w,
                _pos_y + slot_sprite_h,
                _counter_radius,
                _counter_radius,
                false
              );
              draw_circle(_counter_position_x, _counter_position_y, _counter_radius, false);
              draw_reset();
            }
          }
        }
      }
    }
  }
}

draw_reset();
