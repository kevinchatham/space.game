function Inventory() constructor {
  _inventory_items = [];

  /// @description Add an item directly to the inventory in its own slot.
  /// @param {String} _name
  /// @param {Real} _quantity
  /// @param {Asset.GMSprite} _sprite
  item_set = function (_name, _quantity, _sprite) {
    array_push(_inventory_items, {
      name: _name,
      quantity: _quantity,
      sprite: _sprite
    });
  };

  /// @description Find an item in the inventory by name.
  /// @param {String} _name
  item_find = function (_name) {
    for (var _i = 0; _i < array_length(_inventory_items); _i++) {
      if (_name == _inventory_items[_i].name) {
        return _i;
      }
    }

    return -1;
  };

  /// @description Add a specific item to the inventory or increase count if item already exists.
  /// @param {String} _name
  /// @param {Real} _quantity
  /// @param {Asset.GMSprite} _sprite
  item_add = function (_name, _quantity, _sprite) {
    var _index = item_find(_name);

    if (_index >= 0) {
      _inventory_items[_index].quantity += _quantity;
    } else {
      item_set(_name, _quantity, _sprite);
    }
  };

  /// @description Remove a certain amount of an item from the player's inventory.
  /// @param {String} _name
  /// @param {Real} _quantity
  item_subtract = function (_name, _quantity) {
    var _index = item_find(_name);

    if (_index >= 0) {
      if (item_has(_name, _quantity)) {
        _inventory_items[_index].quantity -= _quantity;

        if (_inventory_items[_index].quantity <= 0) {
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
      return _inventory_items[_index].quantity >= _quantity;
    }

    return false;
  };

  /// @description Removes a given index from the inventory.
  /// @param {Real} _index
  item_remove = function (_index) {
    array_delete(_inventory_items, _index, 1);
  };

  /// @description Swaps two inventory slots
  /// @param {Real} _index_from
  /// @param {Real} _index_to
  item_swap = function (_index_from, _index_to) {
    var _item_from = _inventory_items[_index_from];
    _inventory_items[_index_from] = _inventory_items[_index_to];
    _inventory_items[_index_to] = _item_from;
  };

  /// @description Returns array of inventory items.
  /// @returns {Array<Struct>}
  get_all_items = function () {
    return _inventory_items;
  };

  /// @description Print inventory items to console.
  log = function () {
    show_debug_message(json_stringify(_inventory_items));
  };

  save = function () {
    var _json_string = json_stringify(_inventory_items);
    var _buffer = buffer_create(string_byte_length(_json_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json_string);
    buffer_save(_buffer, "inventory.json");
    buffer_delete(_buffer);
  };

  load = function () {
    var _buffer = buffer_load("inventory.json");

    if (_buffer != -1) {
      var _json_string = buffer_read(_buffer, buffer_string);

      buffer_delete(_buffer);

      var _json = json_parse(_json_string);

      _inventory_items = _json;
    }
  };
}
