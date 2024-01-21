if(visible){
	var _g_width = display_get_gui_width();
	var _g_height = display_get_gui_height();

	// draw outside shadow
	draw_set(c_black, 0.2);
	draw_rectangle(
		ui_padding_x + ui_border_size,
		ui_padding_y + ui_border_size,
		(_g_width - ui_padding_x) + ui_border_size,
		(_g_height - ui_padding_y) + ui_border_size,
		false
	);

	// draw outside rectangle
	draw_set(color_border, 1);
	draw_rectangle(
		ui_padding_x,
		ui_padding_y,
		_g_width - ui_padding_x,
		_g_height - ui_padding_y,
		false
	);

	// draw rectangle inside
	draw_set(color_background, 1);
	draw_rectangle(
		ui_padding_x + ui_border_size,
		ui_padding_y + ui_border_size,
		_g_width - ui_padding_x - ui_border_size,
		_g_height - ui_padding_y - ui_border_size,
		false
	);

	// draw horizontal line
	draw_set(color_border, 1);
	draw_rectangle(
		ui_padding_x + ui_panel_left,
		ui_padding_y + ui_border_size,
		ui_padding_x + ui_panel_left + ui_border_size,
		_g_height - ui_padding_y - ui_border_size,
		false
	);

	// draw text
	draw_set_font(fnt_default);
	text_align(fa_left, fa_top);
	draw_set(color_inventory_text, 1);

	draw_set(c_black, 0.5);
	draw_text(
		ui_padding_x + (ui_border_size * 3) + 4,
		ui_padding_y + (ui_border_size * 4) + 4,
		"Stats"
	);
	draw_set(c_white, 1);
	draw_text(
		ui_padding_x + (ui_border_size * 3),
		ui_padding_y + (ui_border_size * 4),
		"Stats"
	);

	draw_set(c_black, 0.5);
	draw_text(
		ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
		ui_padding_y + (ui_border_size * 4) + 4,
		"Inventory"
	);
	draw_set(c_white, 1);
	draw_text(
		ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin,
		ui_padding_y + (ui_border_size * 4),
		"Inventory"
	);

	// reset text
	draw_set_font(-1);

	// mouse position
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);

	// draw inventory place holders
	var _inventory_items = inventory.item_get();
	for (var _row = 0; _row < inventory_rows; _row++) {
		var _pos_y = ui_padding_y + (ui_border_size * 13) +
		(_row * (ui_inventory_margin + ui_inventory_box));
	    for (var _column = 0; _column < inventory_columns; _column++) {
			var _pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (_column * (ui_inventory_margin + ui_inventory_box));

			// draw offset sprite for shadow
			draw_sprite_ext(
				spr_inventory_box,
				0,
				_pos_x + 4,
				_pos_y + 4,
				1,
				1,
				0,
				c_black,
				0.4
			);

			// draw inventory box sprite
			draw_sprite(spr_inventory_box, 0, _pos_x, _pos_y);

			var _inventory_index = (_row * inventory_columns) + _column;
			if(_inventory_index <= array_length(_inventory_items) - 1) {
				// draw inventory sprite
				draw_sprite(_inventory_items[_inventory_index].sprite, 0, _pos_x, _pos_y);
			}

			// if our mouse is between one of the columns let's highlight it
			if(is_between(_mx, _pos_x, _pos_x + ui_inventory_box)) {
				if(is_between(_my, _pos_y, _pos_y + ui_inventory_box)) {
					draw_set(color_inventory_highlight, 0.2);
					draw_rectangle(
						_pos_x,
						_pos_y,
						_pos_x + ui_inventory_box,
						_pos_y + ui_inventory_box,
						false
					);
					draw_reset();
				}
			}

			//// now do this again but for quantity only
			if(_inventory_index <= array_length(_inventory_items) - 1) {
				draw_set(#232323, 1);
				draw_circle(
					_pos_x + ui_inventory_box,
					_pos_y + ui_inventory_box,
					14,
					false
				);

				draw_set(c_white, 1);
				text_align(fa_center, fa_middle);

				draw_text(
					_pos_x + ui_inventory_box,
					_pos_y + ui_inventory_box,
					_inventory_items[_inventory_index].quantity
				);
			}
		}
	}

	draw_reset();
}
