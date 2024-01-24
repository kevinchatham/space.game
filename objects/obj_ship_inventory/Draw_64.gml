if (visible) {
  var _mx = device_mouse_x_to_gui(0);
  var _my = device_mouse_y_to_gui(0);
  var _sprite_width = sprite_get_width(spr_inventory_slot);
  var _sprite_height = sprite_get_height(spr_inventory_slot);
  var _initial_padding_x = window_padding_x + sprite_padding_x;
  var _initial_padding_y = window_padding_y + sprite_padding_y;
  var _inventory_width =
    window_padding_x + sprite_padding_x * (inventory_columns + 1) + _sprite_width * (inventory_columns - 1);
  var _inventory_height =
    window_padding_y + sprite_padding_y * (inventory_rows + 1) + _sprite_height * (inventory_rows - 1);

  // draw inventory box
  draw_sprite_stretched(spr_inventory_box, 0, window_padding_x, window_padding_y, _inventory_width, _inventory_height);

  for (var _row = 0; _row < inventory_rows; _row++) {
    for (var _column = 0; _column < inventory_columns; _column++) {
      // draw inventory slots
      var _pos_x = _initial_padding_x + (_sprite_width + sprite_padding_x) * _column;
      var _pos_y = _initial_padding_y + (_sprite_height + sprite_padding_y) * _row;
      draw_sprite(spr_inventory_slot, 0, _pos_x, _pos_y);

      // draw inventory sprite
      var _inventory_index = _row * inventory_columns + _column;
      if (_inventory_index <= array_length(inventory_items) - 1) {
        var _item_pos_x = _pos_x + _sprite_width / 2;
        var _item_pos_y = _pos_y + _sprite_height / 2;
        draw_sprite(inventory_items[_inventory_index].sprite, 0, _item_pos_x, _item_pos_y);

        // draw counter / text
        var _counter_position_x = _pos_x + _sprite_width;
        var _counter_position_y = _pos_y + _sprite_height;
        var _counter_radius = _sprite_width / 3;
        draw_set(c_black, 1);
        draw_circle(_counter_position_x, _counter_position_y, _counter_radius, false);
        text_align(fa_center, fa_middle);
        draw_set_font(fnt_default);
        draw_set(c_white, 1);
        draw_text(_counter_position_x, _counter_position_y, inventory_items[_inventory_index].quantity);

        // highlight inventory slot if hovering
        if (is_between(_mx, _pos_x, _pos_x + _sprite_width)) {
          if (is_between(_my, _pos_y, _pos_y + _sprite_height)) {
            draw_set(c_gray, 0.1);
            draw_roundrect_ext(
              _pos_x,
              _pos_y,
              _pos_x + _sprite_width,
              _pos_y + _sprite_height,
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

draw_reset();
