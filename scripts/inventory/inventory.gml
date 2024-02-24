/// @param {String} _name
/// @param {Real} _quantity
/// @param {Asset.GMSprite} _sprite
function InventoryItem(_name, _quantity, _sprite) constructor {
  name = _name;
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
  item_set = function (_item) {
    var _empty_slot = item_find(empty_slot_name);

    if (_empty_slot == -1) {
      log("Inventory is full!");
      return;
    }

    inventory_items[_empty_slot] = {
      name: _item.name,
      quantity: _item.quantity,
      sprite: _item.sprite
    };
  };

  /// @description Find an item in the inventory by name. This method uses string_starts_with() under the hood.
  /// @param {String} _name
  item_find = function (_name) {
    for (var _i = 0; _i < array_length(inventory_items); _i++) {
      if (string_starts_with(inventory_items[_i].name, _name)) {
        return _i;
      }
    }

    return -1;
  };

  /// @description Add a specific item to the inventory or increase count if item already exists.
 /// @param {Struct.InventoryItem} _item
  item_add = function (_item) {
    var _index = item_find(_item.name);

    if (_index >= 0) {
      inventory_items[_index].quantity += _item.quantity;
    } else {
      item_set(_item);
    }
  };

  /// @description Remove a certain amount of an item from the player's inventory.
  /// @param {String} _name
  /// @param {Real} _quantity
  item_subtract = function (_name, _quantity) {
    var _index = item_find(_name);

    if (_index >= 0) {
      if (item_has(_name, _quantity)) {
        inventory_items[_index].quantity -= _quantity;

        if (inventory_items[_index].quantity <= 0) {
          item_remove(_index);
        }
      }
    }
  };

  /// @description Check to see if player has at least a certain amount of an item in the inventory.
  /// @param {String} _name
  /// @param {Real} _quantity
  /// @returns {Bool}
  item_has = function (_name, _quantity) {
    var _index = item_find(_name);

    if (_index >= 0) {
      return inventory_items[_index].quantity >= _quantity;
    }

    return false;
  };

  /// @description Removes a given index from the inventory.
  /// @param {Real} _index
  item_remove = function (_index) {
    var _slot_name = empty_slot_name + string_random(10);

    array_set(inventory_items,_index,{
      name: _slot_name,
      quantity: 0,
      sprite: spr_none
    })
  };

  /// @description Swaps two inventory slots
  /// @param {Real} _index_from
  /// @param {Real} _index_to
  item_swap = function (_index_from, _index_to) {
    var _item_from = inventory_items[_index_from];
    inventory_items[_index_from] = inventory_items[_index_to];
    inventory_items[_index_to] = _item_from;
  };

  /// @description Returns array of inventory items.
  /// @returns {Array<Struct.InventoryItem>}
  get_all_items = function () {
    return inventory_items;
  };

  /// @description Print inventory items to console.
  log_to_console = function () {
    log(json_stringify(inventory_items));
  };

  /// @description Saves the inventory as json to the local file system.
  save = function () {
    var _json_string = json_stringify(inventory_items);
    var _buffer = buffer_create(string_byte_length(_json_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json_string);
    buffer_save(_buffer, inventory_save_file_name);
    buffer_delete(_buffer);

    log("Saved:", json_stringify(inventory_items));
  };

  /// @description Loads the json inventory from the local file system. Loads an empty item into every remaining slot.
  load = function () {
    var _buffer = buffer_load(inventory_save_file_name);

    // creates the inventory save file if it doesn't exist
    if (_buffer == -1)
    {
      buffer_delete(_buffer);
      save();
      load();
    }

    var _json_string = buffer_read(_buffer, buffer_string);

    buffer_delete(_buffer);

    var _items = json_parse(_json_string);

    for (var _i = array_length(_items); _i < slot_count; _i++) {
      var _slot_name = empty_slot_name + string_random(10);
      array_push(inventory_items, {
        name: _slot_name,
        quantity: 0,
        sprite: spr_none
      });
    }

    inventory_items = array_concat(_items, inventory_items);

    log("Loaded:", json_stringify(inventory_items));
  };

  /// @param {Real} _count       number of characters to return
  function string_random(_count)
  {
      var _out = "";
      repeat (_count) {
        _out += chr(floor(random(26)) + 97); // ASCII values for lowercase letters (97-122)
      }
      return _out;
  }
}
