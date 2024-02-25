/// @param {String} _display_name
/// @param {Asset.GMSprite} _sprite
function Item(_display_name, _sprite) constructor {
  display_name = _display_name;
  sprite = _sprite;
}

/// @param {Struct.Item} _item
/// @param {Real} _quantity
function InventoryItem(_item, _quantity) constructor {
  item = _item;
  quantity = _quantity;
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
  /// @param {Real} _quantity
  inventory_set = function(_item, _quantity) {
    var _empty_slot = inventory_find_empty_index();
    if (_empty_slot == -1) {
      return;
    }
    inventory_items[_empty_slot] = new InventoryItem(_item, _quantity);
    inventory_save();
  };

  inventory_find_empty_index = function() {
    for (var _i = 0; _i < array_length(inventory_items); _i++) {
      if (string_starts_with(inventory_items[_i].item.display_name, empty_slot_name)) {
        return _i;
      }
    }
    return -1;
  };

  /// @description Find an item in the inventory by name. This method uses string_starts_with() under the hood.
  /// @param {Struct.Item} _item
  inventory_find_index = function(_item) {
    for (var _i = 0; _i < array_length(inventory_items); _i++) {
      if (inventory_items[_i].item.sprite == _item.sprite) {
        return _i;
      }
    }
    return -1;
  };

  /// @description Add a specific item to the inventory or increase count if item already exists.
  /// @param {Struct.Item} _item
  /// @param {Real} _quantity
  inventory_add = function(_item, _quantity) {
    var _index = inventory_find_index(_item);
    if (_index >= 0) {
      inventory_items[_index].quantity += _quantity;
      inventory_save();
    } else {
      inventory_set(_item, _quantity);
    }
  };

  /// @description Remove a certain amount of an item from the player's inventory.
  /// @param {Struct.Item} _item
  /// @param {Real} _quantity
  inventory_subtract = function(_item, _quantity) {
    var _index = inventory_find_index(_item);
    if (_index == -1) {
      return;
    }
    if (inventory_has(_item, _quantity)) {
      inventory_items[_index].quantity -= _quantity;
      if (inventory_items[_index].quantity <= 0) {
        inventory_remove(_item);
      }
      inventory_save();
    }
  };

  /// @description Check to see if player has at least a certain amount of an item in the inventory.
  /// @param {Struct.Item} _item
  /// @param {Real} _quantity
  /// @returns {Bool}
  inventory_has = function(_item, _quantity) {
    var _index = inventory_find_index(_item);
    if (_index >= 0) {
      return inventory_items[_index].quantity >= _quantity;
    }
    return false;
  };

  /// @description Removes a given index from the inventory.
  /// @param {Struct.Item} _item
  inventory_remove = function(_item) {
    var _index = inventory_find_index(_item);
    var _slot_name = empty_slot_name + random_string(10);
    var _empty_item = new Item(_slot_name, spr_none);
    array_set(inventory_items, _index, new InventoryItem(_empty_item, 0));
    inventory_save();
  };

  /// @description Swaps two inventory slots
  /// @param {Real} _from_index
  /// @param {Real} _to_index
  inventory_swap = function(_from_index, _to_index) {
    var _item_from = inventory_items[_from_index];
    inventory_items[_from_index] = inventory_items[_to_index];
    inventory_items[_to_index] = _item_from;
    inventory_save();
  };

  /// @description Returns array of inventory items.
  /// @returns {Array<Struct.InventoryItem>}
  inventory_list = function() {
    return inventory_items;
  };

  /// @description Print inventory items to console.
  inventory_log_to_console = function() {
    log(json_stringify(inventory_items));
  };

  /// @description Saves the inventory as json to the local file system.
  inventory_save = function() {
    var _json_string = json_stringify(inventory_items);
    var _file = file_text_open_write(inventory_save_file_name);
    file_text_write_string(_file, json_stringify(inventory_items));
    file_text_close(_file);
  };

  /// @description Loads the json inventory from the local file system. Loads an empty item into every remaining slot.
  inventory_load = function() {
    var _file = file_text_open_read(inventory_save_file_name);

    // creates the inventory save file if it doesn't exist
    if (_file == -1) {
      inventory_save();
      inventory_load();
      return;
    }

    var _json = file_text_read_string(_file);

    var _items = json_parse(_json);

    for (var _i = array_length(_items); _i < slot_count; _i++) {
      var _slot_name = empty_slot_name + random_string(10);
      var _empty_item = new Item(_slot_name, spr_none);
      array_push(inventory_items, new InventoryItem(_empty_item, 0));
    }

    inventory_items = array_concat(_items, inventory_items);

    file_text_close(_file);

    inventory_save(); // save padded out inventory
  };
}
