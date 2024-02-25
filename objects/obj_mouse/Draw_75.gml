/// @description Draw GUI End
display_set_gui_maximise();

if (!obj_ship_inventory.is_visible) return;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (item_drag != undefined && slot_drag_index != -1) {
  var _selected_item = inventory.inventory_list()[slot_drag_index];
  draw_set_alpha(0.5);
  draw_roundrect_color(
    _mx - obj_ship_inventory.slot_sprite_w / 2,
    _my - obj_ship_inventory.slot_sprite_h / 2,
    _mx + obj_ship_inventory.slot_sprite_w / 2,
    _my + obj_ship_inventory.slot_sprite_h / 2,
    c_white,
    c_white,
    false
  );
  draw_sprite(_selected_item.item.sprite, 0, _mx, _my);
  draw_set_alpha(1);
}

draw_reset();
