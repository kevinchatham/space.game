var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _inventory_items = inventory.item_get();
var _pos_x = 0;
var _pos_y = 0;

if(mouse_check_button_released(mb_left)) {
	for (var _row = 0; _row < inventory_rows; _row++) {
		_pos_y = ui_padding_y + (ui_border_size * 13) + (_row * (ui_inventory_margin + ui_inventory_box));
		for (var _column = 0; _column < inventory_columns; _column++) {
			_pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (_column * (ui_inventory_margin + ui_inventory_box));

			if(is_between(_mx, _pos_x, _pos_x + ui_inventory_box)) {
				if(is_between(_my, _pos_y, _pos_y + ui_inventory_box)) {
					var _inventory_index = (_row * inventory_columns) + _column;
					// now we need to check if we have an inventory item here
					if(_inventory_index <= array_length(_inventory_items) - 1) {
						show_debug_message($"Using {_inventory_items[_inventory_index].name}");

						inventory.item_subtract(_inventory_items[_inventory_index].name, 1);
					} else {
						show_debug_message("No inventory item here !");
					}
				}
			}
		}
	}
}
