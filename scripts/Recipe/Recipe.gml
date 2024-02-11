function Recipe() : Inventory(4) constructor {
  _recipies = [];

  recipe_find = function (_name) {
    for (var _i = 0; _i < array_length(_recipies); _i++) {
      if (_name == _recipies[_i].name) {
        return _i;
      }
    }

    return -1;
  };

  recipe_add = function (_name, _requirement, _products, _sprite) {
    array_push(_recipies, {
      name: _name,
      requirements: _requirement,
      products: _products,
      sprite: _sprite
    });
  };

  recipe_has = function (_name) {
    var _index = recipe_find(_name);
    var _can_craft = false;

    if (_index >= 0) {
      _can_craft = true;
      for (
        var _requirement_index = 0;
        _requirement_index < array_length(_recipies[_index].requirements);
        _requirement_index++
      ) {
        if (
          item_has(
            _recipies[_index].requirements[_requirement_index].name,
            _recipies[_index].requirements[_requirement_index].quantity
          ) == false
        ) {
          _can_craft = false;
          break;
        }
      }
    }

    return _can_craft;
  };

  recipe_craft = function (_name) {
    var _index = recipe_find(_name);

    if (_index >= 0) {
      if (recipe_has(_name)) {
        for (
          var _requirement_index = 0;
          _requirement_index < array_length(_recipies[_index].requirements);
          _requirement_index++
        ) {
          item_subtract(
            _recipies[_index].requirements[_requirement_index].name,
            _recipies[_index].requirements[_requirement_index].quantity
          );
        }

        for (var _product_index = 0; _product_index < array_length(_recipies[_index].products); _product_index++) {
          item_add(
            _recipies[_index].products[_product_index].name,
            _recipies[_index].products[_product_index].quantity,
            _recipies[_index].products[_product_index].sprite
          );
        }
      }
    }
  };

  recipe_get = function () {
    return _recipies;
  };
}
