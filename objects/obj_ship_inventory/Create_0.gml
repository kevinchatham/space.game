visible=false;

inventory = new Inventory();

// * TESTING ONLY
inventory.item_add("Coal", 3, spr_coal_ore);
inventory.item_add("Coal", 2, spr_coal_ore);
inventory.item_add("Ice", 2, spr_ice_ore);
show_debug_message(inventory);
// *

display_set_gui_size(
    obj_space_camera.view_port_max_x - obj_space_camera.view_port_min_x,
    obj_space_camera.view_port_max_y - obj_space_camera.view_port_min_y
);

g_width = display_get_gui_width();
g_height = display_get_gui_height();

inventory_columns = 4;
inventory_rows = 4;

window_padding_x = 32;
window_padding_y = 32;
sprite_padding_x = 8;
sprite_padding_y = 8;

// ui_padding_x = (g_width / 3) - sprite_get_width(spr_inventory_slot);
// ui_padding_y = (g_height / 3) - sprite_get_height(spr_inventory_slot);
// ui_inventory_padding = 24;
// ui_inventory_margin = 4;

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;