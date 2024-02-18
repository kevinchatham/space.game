inventory_hover = -1;
slot_hover = -1;
inventory_drag = undefined;
slot_drag = -1;
item_drag = undefined;
inventory_items = obj_ship_inventory.inventory.get_all_items();
hovering_inventory = false;

function mouse_over() {
  slot_hover = -1;
  inventory_hover = -1;
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
          if (_inventory_index <= array_length(inventory_items) - 1) {
            slot_hover = _inventory_index;
            inventory_hover = obj_ship_inventory.id;
            hovering_inventory = true;
          } else hovering_inventory = false;
        }
      }
    }
  }
}

function state_free() {
  mouse_over();
  // you've started dragging an item
  if (
    mouse_check_button(mb_left) &&
    slot_hover != -1 &&
    inventory_items[slot_hover] != undefined &&
    inventory_items[slot_hover].quantity != 0
  ) {
    state = state_drag;
    item_drag = inventory_items[slot_hover];
    inventory_drag = inventory_hover;
    slot_drag = slot_hover;
  }
}

function state_drag() {
  mouse_over();
  var _mx = device_mouse_x_to_gui(0);
  var _my = device_mouse_y_to_gui(0);

  // if the mouse button is released
  if (!mouse_check_button(mb_left)) {
    // swap if you are hovering over another item
    if (slot_hover != -1) {
      obj_ship_inventory.inventory.item_swap(slot_drag, slot_hover);
    }

    // if not hovering the inventory, spawn the items in space to throw them away
    if (!hovering_inventory) {
      for (var _i = 0; _i < inventory_items[slot_drag].quantity; _i++) {
        var _x = x + irandom(20);
        var _y = y + irandom(20);
        var _id = instance_create_layer(mouse_x, mouse_y, global.main_layer, obj_resource, {
          sprite_index: inventory_items[slot_drag].sprite
        });
      }
      array_delete(inventory_items, slot_drag, 1);
    }

    state = state_free;
    item_drag = -1;
    inventory_drag = -1;
    slot_drag = -1;
  }
}

state = state_free;
