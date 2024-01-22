if (visible) {
  // draw inventory box
  draw_sprite_stretched(
    spr_inventory_box,
    0,
    window_offset,
    window_offset,
    window_offset + sprite_padding_x * inventory_columns,
    window_offset + sprite_padding_y * inventory_rows
  );

  for (var _row = 0; _row < inventory_rows; _row++) {
    for (var _column = 0; _column < inventory_columns; _column++) {
      var _pos_x = (window_offset + sprite_padding) * _column;
      var _pos_y = window_offset + sprite_padding_y * _row;
      draw_sprite(spr_inventory_slot, 0, _pos_x, _pos_y);
    }
  }
}
// if(visible){
// 	var _inventory_items = inventory.item_get();
// 	var _inventory_width = g_width - ui_padding_x * 2;
// 	var _inventory_height = g_height - ui_padding_y * 2;
// 	var _mx = device_mouse_x_to_gui(0);
// 	var _my = device_mouse_y_to_gui(0);

// 	// draw inventory box
// 	draw_sprite_stretched(
// 		spr_inventory_box,
// 		0,
// 		ui_padding_x,
// 		ui_padding_y,
// 		_inventory_width,
// 		_inventory_height
// 	)

// 	// draw inventory place holders
// 	for (var _row = 0; _row < inventory_rows; _row++) {
// 		for (var _column = 0; _column < inventory_columns; _column++) {
// 			// var _pos_x = ui_padding_x + ui_inventory_padding + (_column * ui_inventory_margin);
// 			// var _pos_y = ui_padding_y + (_row * ui_inventory_margin);

// 			var _pos_x = ui_padding_x + (ui_padding_x / _column);
// 			var _pos_y = _inventory_height / _row;

// 			// draw inventory box sprite
// 			draw_sprite(spr_inventory_slot, 0, _pos_x, _pos_y);

// 			var _inventory_index = (_row * inventory_columns) + _column;
// 			if(_inventory_index <= array_length(_inventory_items) - 1) {
// 				// draw inventory sprite
// 				draw_sprite(_inventory_items[_inventory_index].sprite, 0, _pos_x, _pos_y);
// 			}

// 			// if our mouse is between one of the columns let's highlight it
// 			if(is_between(_mx, _pos_x, _pos_x)) {
// 				if(is_between(_my, _pos_y, _pos_y)) {
// 					draw_set(color_inventory_highlight, 0.2);
// 					draw_rectangle(
// 						_pos_x,
// 						_pos_y,
// 						_pos_x,
// 						_pos_y,
// 						false
// 					);
// 					draw_reset();
// 				}
// 			}

// 			// now do this again but for quantity only
// 			if(_inventory_index <= array_length(_inventory_items) - 1) {
// 				draw_set(#232323, 1);
// 				draw_circle(
// 					_pos_x,
// 					_pos_y,
// 					14,
// 					false
// 				);

// 				draw_set(c_white, 1);
// 				text_align(fa_center, fa_middle);

// 				draw_text(
// 					_pos_x,
// 					_pos_y,
// 					_inventory_items[_inventory_index].quantity
// 				);
// 			}
// 		}
// 	}

// 	draw_reset();
// }
