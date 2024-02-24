/// @param {String} _display_name
/// @param {Asset.GMSprite} _sprite
/// @param {Real} _quantity
function InventoryItem(_display_name, _sprite, _quantity) constructor {
  display_name = _display_name;
  quantity = _quantity;
  sprite = _sprite;
}

/// @param {Real} _slot_count
function Inventory(_slot_count) constructor {
  /// @type {Array<Struct.InventoryItem>}
  inventory_items = [];
  slot_count = _slot_count;
  empty_slot_name = "empty-slot-";
  inventory_save_file_name = "inventory.json";

  /// @description Add an item directly to the inventory in its own slot.
  /// @param {Struct.InventoryItem} _item
  inventory_set = function (_item) {
    var _empty_slot = inventory_find_index(_item);

    if (_empty_slot == -1) {
      log("Inventory is full!");
      return;
    }

    inventory_items[_empty_slot] = _item;
  };

  /// @description Find an item in the inventory by name. This method uses string_starts_with() under the hood.
  /// @param {Struct.InventoryItem} _item
  inventory_find_index = function (_item) {
    for (var _i = 0; _i < array_length(inventory_items) - 1; _i++) {

log(json_stringify(inventory_items[_i]))

      log("inventory_sprite", sprite_get_name(inventory_items[_i].sprite))
      log("item_sprite", sprite_get_name(_item.sprite))

      if (inventory_items[_i].sprite == _item.sprite) {
        return _i;
      }
    }

    return -1;
  };

  /// @description Add a specific item to the inventory or increase count if item already exists.
 /// @param {Struct.InventoryItem} _item
  inventory_add = function (_item) {
    var _index = inventory_find_index(_item);

    if (_index >= 0) {
      inventory_items[_index].quantity += _item.quantity;
    } else {
      inventory_set(_item);
    }
  };

  /// @description Remove a certain amount of an item from the player's inventory.
  /// @param {Struct.InventoryItem} _item
  /// @param {Real} _quantity
  inventory_subtract = function (_item, _quantity) {
    var _index = inventory_find_index(_item);

    if (_index >= 0) {
      if (inventory_has(_item, _quantity)) {
        inventory_items[_index].quantity -= _quantity;

        if (inventory_items[_index].quantity <= 0) {
          inventory_remove(_item);
        }
      }
    }
  };

  /// @description Check to see if player has at least a certain amount of an item in the inventory.
  /// @param {Struct.InventoryItem} _item
  /// @param {Real} _quantity
  /// @returns {Bool}
  inventory_has = function (_item, _quantity) {
    var _index = inventory_find_index(_item);

    if (_index >= 0) {
      return inventory_items[_index].quantity >= _quantity;
    }

    return false;
  };

  /// @description Removes a given index from the inventory.
  /// @param {Struct.InventoryItem} _item
  inventory_remove = function (_item) {
    var _slot_name = empty_slot_name + random_string(10);

    var _index = inventory_find_index(_item);

    array_set(inventory_items, _index, {
      name: _slot_name,
      quantity: 0,
      sprite: spr_none
    })
  };

  /// @description Swaps two inventory slots
  /// @param {Struct.InventoryItem} _from
  /// @param {Struct.InventoryItem} _to
  inventory_swap = function (_from, _to) {
    var _from_index = inventory_find_index(_from);
    var _to_index = inventory_find_index(_to);
    inventory_items[_from_index] = inventory_items[_to_index];
    inventory_items[_to_index] = _from;
  };

  /// @description Returns array of inventory items.
  /// @returns {Array<Struct.InventoryItem>}
  inventory_list = function () {
    return inventory_items;
  };

  /// @description Print inventory items to console.
  inventory_log_to_console = function () {
    log(json_stringify(inventory_items));
  };

  /// @description Saves the inventory as json to the local file system.
  inventory_save = function () {
    var _json_string = json_stringify(inventory_items);
    var _buffer = buffer_create(string_byte_length(_json_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json_string);
    buffer_save(_buffer, inventory_save_file_name);
    buffer_delete(_buffer);

    log("Saved:", json_stringify(inventory_items));
  };

  /// @description Loads the json inventory from the local file system. Loads an empty item into every remaining slot.
  inventory_load = function () {
    var _buffer = buffer_load(inventory_save_file_name);

    // creates the inventory save file if it doesn't exist
    if (_buffer == -1)
    {
      inventory_save();
      inventory_load();
      return;
    }

    var _json_string = buffer_read(_buffer, buffer_string);

    buffer_delete(_buffer);

    var _items = json_parse(_json_string);

    for (var _i = array_length(_items); _i < slot_count; _i++) {
      var _slot_name = empty_slot_name + random_string(10);
      array_push(inventory_items, {
        name: _slot_name,
        quantity: 0,
        sprite: spr_none
      });
    }

    inventory_items = array_concat(_items, inventory_items);

    log("Loaded:", json_stringify(inventory_items));
  };
}
