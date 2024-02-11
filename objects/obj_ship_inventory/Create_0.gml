visible = false;

inventory = new Inventory();

inventory.load();

// * TESTING ONLY
show_debug_message(inventory);
// *

inventory_items = inventory.get_all_items();

display_set_gui_size(
  obj_space_camera.view_port_max_x - obj_space_camera.view_port_min_x,
  obj_space_camera.view_port_max_y - obj_space_camera.view_port_min_y
);

g_width = display_get_gui_width();
g_height = display_get_gui_height();

inventory_columns = 2;
inventory_rows = 2;
window_padding_x = 32;
window_padding_y = 32;
sprite_padding_x = 16;
sprite_padding_y = 16;

sprite_w = sprite_get_width(spr_inventory_slot);
sprite_h = sprite_get_height(spr_inventory_slot);
initial_padding_x = window_padding_x + sprite_padding_x;
initial_padding_y = window_padding_y + sprite_padding_y;
inventory_width = window_padding_x + sprite_padding_x * (inventory_columns + 1) + sprite_w * (inventory_columns - 1);
inventory_height = window_padding_y + sprite_padding_y * (inventory_rows + 1) + sprite_h * (inventory_rows - 1);
