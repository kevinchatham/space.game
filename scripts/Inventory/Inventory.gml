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
  items = [];
  slot_count = _slot_count;
  empty_slot_name = "empty-slot-";
  save_file_name = "inventory.json";

  /// @description Add an item directly to the inventory in its own slot.
  /// @param {Struct.InventoryItem} _item
  /// @param {Real} _quantity
  set = function(_item, _quantity) {
    var _empty_slot = find_empty_index();
    if (_empty_slot == -1) {
      return;
    }
    items[_empty_slot] = new InventoryItem(_item, _quantity);
    save();
  };

  /// @param {Real} _index
  find = function(_index) {
    if (_index < 0 || _index >= length()) {
      return undefined;
    }
    return items[_index];
  };

  find_empty_index = function() {
    for (var _i = 0; _i < array_length(items); _i++) {
      if (string_starts_with(items[_i].item.display_name, empty_slot_name)) {
        return _i;
      }
    }
    return -1;
  };

  /// @description Find an item in the inventory by name. This method uses string_starts_with() under the hood.
  /// @param {Struct.Item} _item
  find_index = function(_item) {
    for (var _i = 0; _i < array_length(items); _i++) {
      if (items[_i].item.sprite == _item.sprite) {
        return _i;
      }
    }
    return -1;
  };

  /// @description Add a specific item to the inventory or increase count if item already exists.
  /// @param {Struct.Item} _item
  /// @param {Real} _quantity
  add = function(_item, _quantity) {
    var _index = find_index(_item);
    if (_index >= 0) {
      items[_index].quantity += _quantity;
      save();
    } else {
      set(_item, _quantity);
    }
  };

  /// @description Remove a certain amount of an item from the player's inventory.
  /// @param {Struct.Item} _item
  /// @param {Real} _quantity
  subtract = function(_item, _quantity) {
    var _index = find_index(_item);
    if (_index == -1) {
      return;
    }
    if (has(_item, _quantity)) {
      items[_index].quantity -= _quantity;
      if (items[_index].quantity <= 0) {
        remove(_item);
      }
      save();
    }
  };

  /// @description Check to see if player has at least a certain amount of an item in the inventory.
  /// @param {Struct.Item} _item
  /// @param {Real} _quantity
  /// @returns {Bool}
  has = function(_item, _quantity) {
    var _index = find_index(_item);
    if (_index >= 0) {
      return items[_index].quantity >= _quantity;
    }
    return false;
  };

  /// @description Removes a given index from the inventory.
  /// @param {Struct.Item} _item
  remove = function(_item) {
    var _index = find_index(_item);
    var _slot_name = empty_slot_name + random_string(10);
    var _empty_item = new Item(_slot_name, spr_none);
    array_set(items, _index, new InventoryItem(_empty_item, 0));
    save();
  };

  /// @description Swaps two inventory slots
  /// @param {Real} _from_index
  /// @param {Real} _to_index
  swap = function(_from_index, _to_index) {
    var _item_from = items[_from_index];
    items[_from_index] = items[_to_index];
    items[_to_index] = _item_from;
    save();
  };

  /// @description Returns array of inventory items.
  /// @returns {Array<Struct.InventoryItem>}
  list = function() {
    return items;
  };

  length = function() {
    return array_length(items);
  };

  /// @description Print inventory items to console.
  log_to_console = function() {
    log(json_stringify(items));
  };

  /// @description Saves the inventory as json to the local file system.
  save = function() {
    var _json_string = json_stringify(items);
    var _file = file_text_open_write(save_file_name);
    file_text_write_string(_file, json_stringify(items));
    file_text_close(_file);
  };

  /// @description Loads the json inventory from the local file system. Loads an empty item into every remaining slot.
  load = function() {
    var _file = file_text_open_read(save_file_name);

    // creates the inventory save file if it doesn't exist
    if (_file == -1) {
      save();
      load();
      return;
    }

    var _json = file_text_read_string(_file);

    var _items = json_parse(_json);

    for (var _i = array_length(_items); _i < slot_count; _i++) {
      var _slot_name = empty_slot_name + random_string(10);
      var _empty_item = new Item(_slot_name, spr_none);
      array_push(items, new InventoryItem(_empty_item, 0));
    }

    items = array_concat(_items, items);

    file_text_close(_file);

    save(); // save padded out inventory
  };
}
