visible=false;

inventory = new Inventory();

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

inventory_columns = 5;
inventory_rows = 5;
window_padding_x = 32;
window_padding_y = 32;
sprite_padding_x = 16;
sprite_padding_y = 16;

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;