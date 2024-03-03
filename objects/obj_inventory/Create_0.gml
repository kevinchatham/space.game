// * GM Variable Definitions
columns = columns;
rows = rows;
window_padding_x = window_padding_x;
window_padding_y = window_padding_y;
sprite_padding_x = sprite_padding_x;
sprite_padding_y = sprite_padding_y;
name = name;
// *

// * the inventory itself
inventory = new Inventory(columns * rows, name);
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
inventory_width = sprite_padding_x * (columns + 1) + slot_sprite_w * columns;
inventory_height = sprite_padding_y * (rows + 1) + slot_sprite_h * rows;
// *

// * hovering / dragging / state
/// @type {Struct.Inventory}
inventory_hover = undefined;
/// @type {Bool}
is_hovering_inventory = false;
/// @type {Struct.InventoryItem}
item_drag = undefined;
/// @type {Real}
slot_drag_index = -1;
/// @type {Real}
slot_hover_index = -1;

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

  var _mx = device_mouse_x_to_gui(0);
  var _my = device_mouse_y_to_gui(0);

  is_hovering_inventory = is_within(
    _mx,
    _my,
    window_padding_x,
    window_padding_x + inventory_width,
    window_padding_y,
    window_padding_y + inventory_height
  );

  // this means an item being dragged is never rendered behind another inventory
  // it transitions the inventory between ui layers
  // the focus layer is for the inventory the mouse is currently over
  // otherwise the object should be on the main ui layer
  if (is_hovering_inventory) {
    var _obj = asset_get_index(name);
    var _name = object_get_name(_obj);
    var _nearest = instance_nearest(_mx, _my, _obj);
    if (_name == name) {
      layer_add_instance(global.ui_layer, _nearest);
    } else {
      layer_add_instance(global.ui_focus_layer, _nearest);
    }
  }

  for (var _row = 0; _row < rows; _row++) {
    for (var _column = 0; _column < columns; _column++) {
      var _x_min =
        window_padding_x
        + sprite_padding_x
        + (slot_sprite_w + sprite_padding_x) * _column;
      var _y_min =
        window_padding_y
        + sprite_padding_y
        + (slot_sprite_h + sprite_padding_y) * _row;
      var _x_max = _x_min + slot_sprite_w;
      var _y_max = _y_min + slot_sprite_h;

      if (!is_within(_mx, _my, _x_min, _x_max, _y_min, _y_max)) {
        continue;
      }

      var _loop_index = _row * columns + _column;
      if (_loop_index < inventory.length()) {
        slot_hover_index = _loop_index;
        inventory_hover = inventory;
        global.inventory_drag = inventory;
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
  slot_drag_index = slot_hover_index;
  state = state_drag;
}

function state_drag() {
  mouse_over();

  if (mouse_check_button(mb_left)) {
    return; // if user still holding mb
  }

  if (global.inventory_drag != undefined && inventory.name != global.inventory_drag.name) {
    var _inventory_item = inventory.find(slot_drag_index);
    global.inventory_drag.add(_inventory_item.item, _inventory_item.quantity);
    inventory.remove(_inventory_item.item);
  }

  // swap if you are hovering over another item
  if (slot_hover_index != -1) {
    inventory.swap(slot_drag_index, slot_hover_index);
  }

  // if not hovering the inventory, spawn the items in space to throw them away
  if (!is_hovering_inventory) {
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
  slot_drag_index = -1;
}

state = state_free;
