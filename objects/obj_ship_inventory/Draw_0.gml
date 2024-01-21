if(visible){
	draw_sprite_stretched(
		spr_inventory_box,
		0,
		obj_space_camera.view_port_min_x + 12,
		obj_space_camera.view_port_min_y + 12,
		24+row_length*35,
		24+(((inventory_slots-1) / row_length)+1)*30
	)

	for(var _i = 0; _i < inventory_slots; _i++){
		var _xx = obj_space_camera.view_port_min_x + (_i mod row_length) * 36 + 24;
		var _yy = obj_space_camera.view_port_min_y + (_i div row_length) * 36 + 24;
		draw_sprite(spr_inventory_slot, 0,_xx,_yy);
		if(inventory[_i] != -1){
			draw_sprite(spr_coal_ore, 0, _xx + 16, _yy + 16);
		}
	}
}
