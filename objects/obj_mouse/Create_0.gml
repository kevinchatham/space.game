inventory = obj_ship_inventory.inventory;

/// @type {Struct.Inventory}
inventory_drag = undefined;
/// @type {Struct.Inventory}
inventory_hover = undefined;
/// @type {Bool}
inventory_is_hovering = false;
/// @type {Struct.InventoryItem}
item_drag = undefined;
/// @type {Real}
slot_drag_index = -1;
/// @type {Real}
slot_hover_index = -1;

function mouse_over() {
  slot_hover_index = -1;
  inventory_hover = -1;
  inventory_is_hovering = false;

  var _mx = device_mouse_x_to_gui(0);
  var _my = device_mouse_y_to_gui(0);

  for (var _row = 0; _row < obj_ship_inventory.inventory_rows; _row++) {
    for (var _column = 0; _column < obj_ship_inventory.inventory_columns; _column++) {
      var _pos_x =
        obj_ship_inventory.initial_padding_x +
        (obj_ship_inventory.slot_sprite_w + obj_ship_inventory.sprite_padding_x) * _column;
      var _pos_y =
        obj_ship_inventory.initial_padding_y +
        (obj_ship_inventory.slot_sprite_h + obj_ship_inventory.sprite_padding_y) * _row;
      if (is_between(_mx, _pos_x, _pos_x + obj_ship_inventory.inventory_width)) {
        if (is_between(_my, _pos_y, _pos_y + obj_ship_inventory.inventory_height)) {
          var _inventory_index = _row * obj_ship_inventory.inventory_columns + _column;
          if (_inventory_index <= array_length(inventory.inventory_list()) - 1) {
            slot_hover_index = _inventory_index;
            inventory_hover = obj_ship_inventory;
            inventory_is_hovering = true;
          }
        }
      }
    }
  }
}

function state_free() {
  mouse_over();
  var _draggable =
    mouse_check_button(mb_left) &&
    slot_hover_index != -1 &&
    inventory.inventory_list()[slot_hover_index] != undefined &&
    inventory.inventory_list()[slot_hover_index].quantity != 0;

  if (_draggable) {
    state = state_drag;
    item_drag = inventory.inventory_list()[slot_hover_index];
    inventory_drag = obj_ship_inventory;
    slot_drag_index = slot_hover_index;
  }
}

function state_drag() {
  mouse_over();
  var _mx = device_mouse_x_to_gui(0);
  var _my = device_mouse_y_to_gui(0);

  // if the mouse button is released
  if (!mouse_check_button(mb_left)) {
    // swap if you are hovering over another item
    if (slot_hover_index != -1) {
      inventory.inventory_swap(slot_drag_index, slot_hover_index);
    }
    // if not hovering the inventory, spawn the items in space to throw them away
    if (!inventory_is_hovering) {
      for (var _i = 0; _i < inventory.inventory_list()[slot_drag_index].quantity; _i++) {
        var _x = x + irandom(20);
        var _y = y + irandom(20);
        var _id = instance_create_layer(mouse_x, mouse_y, global.main_layer, obj_resource, {
          item: inventory.inventory_list()[slot_drag_index].item
        });
      }

      obj_ship_inventory.inventory.inventory_remove(
        inventory.inventory_list()[slot_drag_index].item
      );
    }

    state = state_free;
    item_drag = undefined;
    inventory_drag = obj_ship_inventory;
    slot_drag_index = -1;
  }
}

state = state_free;
