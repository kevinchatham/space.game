function Inventory() constructor {
  _inventory_items = [];

  item_set = function (_name, _quantity, _sprite) {
    array_push(_inventory_items, {
      name: _name,
      quantity: _quantity,
      sprite: _sprite
    });
  };

  item_find = function (_name) {
    for (var _i = 0; _i < array_length(_inventory_items); _i++) {
      if (_name == _inventory_items[_i].name) {
        return _i;
      }
    }

    return -1;
  };

  item_add = function (_name, _quantity, _sprite) {
    var _index = item_find(_name);

    if (_index >= 0) {
      _inventory_items[_index].quantity += _quantity;
    } else {
      item_set(_name, _quantity, _sprite);
    }
  };

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

  item_has = function (_name, _quantity) {
    var _index = item_find(_name);

    if (_index >= 0) {
      return _inventory_items[_index].quantity >= _quantity;
    }

    return false;
  };

  item_remove = function (_index) {
    array_delete(_inventory_items, _index, 1);
  };

  item_get = function () {
    return _inventory_items;
  };

  toString = function () {
    return json_stringify(_inventory_items);
  } = function () {
    return json_stringify(_inventory_items);
  };
}
