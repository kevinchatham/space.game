// * custom options
columns = 2;
rows = 2;
window_padding_x = 32;
window_padding_y = 32;
sprite_padding_x = 16;
sprite_padding_y = 16;
// *

// * the inventory itself
inventory = new Inventory(columns * rows);
inventory.load();
// *

// * drawing
is_visible = false;
g_width = display_get_gui_width();
g_height = display_get_gui_height();
slot_sprite_w = sprite_get_width(spr_inventory_slot);
slot_sprite_h = sprite_get_height(spr_inventory_slot);
initial_padding_x = window_padding_x + sprite_padding_x;
initial_padding_y = window_padding_y + sprite_padding_y;
inventory_width =
  window_padding_x
  + sprite_padding_x * (columns + 1)
  + slot_sprite_w * (columns - 1);
inventory_height =
  window_padding_y
  + sprite_padding_y * (rows + 1)
  + slot_sprite_h * (rows - 1);
// *

// * hovering / dragging / state
/// @type {Struct.Inventory}
inventory_drag = undefined;
/// @type {Struct.Inventory}
inventory_hover = undefined;
/// @type {Bool}
is_hovering = false;
/// @type {Struct.InventoryItem}
item_drag = undefined;
/// @type {Real}
slot_drag_index = -1;
/// @type {Real}
slot_hover_index = -1;

// *

/// @param {Real} _mx
/// @param {Real} _my
/// @param {Real} _x_min
/// @param {Real} _x_max
/// @param {Real} _y_min
/// @param {Real} _y_max
function is_within(_mx, _my, _x_min, _x_max, _y_min, _y_max) {
  return is_between(_mx, _x_min, _x_max) && is_between(_my, _y_min, _y_max);
}

function mouse_over() {
  slot_hover_index = -1;
  inventory_hover = -1;
  is_hovering = false;

  var _mx = device_mouse_x_to_gui(0);
  var _my = device_mouse_y_to_gui(0);

  for (var _row = 0; _row < rows; _row++) {
    for (var _column = 0; _column < columns; _column++) {
      var _x_min = initial_padding_x + (slot_sprite_w + sprite_padding_x) * _column;
      var _y_min = initial_padding_y + (slot_sprite_h + sprite_padding_y) * _row;
      var _x_max =
        initial_padding_x
        + (slot_sprite_w + sprite_padding_x) * _column
        + inventory_width;
      var _y_max =
        initial_padding_y
        + (slot_sprite_h + sprite_padding_y) * _row
        + inventory_height;

      if (!is_within(_mx, _my, _x_min, _x_max, _y_min, _y_max)) {
        continue;
      }

      var _loop_index = _row * columns + _column;
      if (_loop_index < inventory.length()) {
        slot_hover_index = _loop_index;
        inventory_hover = obj_ship_inventory;
        is_hovering = true;
      }
    }
  }
}

function state_free() {
  mouse_over();

  var _item = inventory.find(slot_hover_index);

  var _draggable =
    mouse_check_button(mb_left)
    && slot_hover_index != -1
    && _item != undefined
    && _item.quantity != 0;

  if (!_draggable) {
    return;
  }

  item_drag = _item;
  inventory_drag = inventory;
  slot_drag_index = slot_hover_index;
  state = state_drag;
}

function state_drag() {
  mouse_over();

  // if the mouse button is released
  if (!mouse_check_button(mb_left)) {
    // swap if you are hovering over another item
    if (slot_hover_index != -1) {
      inventory.swap(slot_drag_index, slot_hover_index);
    }
    // if not hovering the inventory, spawn the items in space to throw them away
    if (!is_hovering) {
      for (var _i = 0; _i < inventory.find(slot_drag_index).quantity; _i++) {
        var _x = x + irandom(20);
        var _y = y + irandom(20);
        var _id = instance_create_layer(
          mouse_x,
          mouse_y,
          global.main_layer,
          obj_resource,
          {init_json: json_stringify(inventory.find(slot_drag_index).item)}
        );
      }

      var _item = inventory.find(slot_drag_index).item;
      inventory.remove(_item);
    }

    state = state_free;
    item_drag = undefined;
    inventory_drag = inventory;
    slot_drag_index = -1;
  }
}

state = state_free;
