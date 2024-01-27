if (visible) {
  obj_ship.can_shoot = !visible;
}

// var _mx = device_mouse_x_to_gui(0);
// var _my = device_mouse_y_to_gui(0);

// var _inventory_items = inventory.get_all_items();

// check if you're clicking an item
// if (mouse_check_button_released(mb_left) && visible) {
//   for (var _row = 0; _row < inventory_rows; _row++) {
//     for (var _column = 0; _column < inventory_columns; _column++) {
//       var _pos_x = initial_padding_x + (sprite_w + sprite_padding_x) * _column;
//       var _pos_y = initial_padding_y + (sprite_h + sprite_padding_y) * _row;
//       if (is_between(_mx, _pos_x, _pos_x + inventory_width)) {
//         if (is_between(_my, _pos_y, _pos_y + inventory_height)) {
//           var _inventory_index = _row * inventory_columns + _column;
//           // now we need to check if we have an inventory item here
//           if (_inventory_index <= array_length(_inventory_items) - 1) {
//             show_debug_message("Using " + _inventory_items[_inventory_index].name);
//           } else {
//             show_debug_message("No inventory item here !");
//           }
//         }
//       }
//     }
//   }
// }
