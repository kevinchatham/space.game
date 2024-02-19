/// @param {String} _name
/// @param {Real} _quantity
function RecipeRequirement(_name, _quantity) constructor {
  name = _name;
  quantity = _quantity;
}

/// @param {String} _name
/// @param {Struct.RecipeRequirement} _requirement
/// @param {Struct.InventoryItem} _product
/// @param {Asset.GMSprite} _sprite
function Recipe(_name, _requirement, _product, _sprite) constructor {
  name = _name;
  requirements = _requirement;
  product = _product;
  sprite = _sprite;
}

function Recipes(): Inventory(4) constructor {
  /// @type {Array<Struct.Recipe>}
  _recipies = [];

  /// @param {String} _name
  recipe_find = function (_name) {
    for (var _i = 0; _i < array_length(_recipies); _i++) {
      if (_name == _recipies[_i].name) {
       return _i;
      }
    }

    return -1;
  };

  /// @param {String} _name
  /// @param {Array<Struct.RecipeRequirement>} _requirement
  /// @param {Struct.InventoryItem} _product
  /// @param {Asset.GMSprite} _sprite
  recipe_add = function (_name, _requirement, _product, _sprite) {
    array_push(_recipies, {
      name: _name,
      requirements: _requirement,
      product: _product,
      sprite: _sprite
    });
  };

  /// @param {String} _name
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

  /// @param {String} _name
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

        var _item = new InventoryItem(
          _recipies[_index].product.name,
          _recipies[_index].product.quantity,
          _recipies[_index].product.sprite
        );
        item_add(_item);
      }
    }
  };

  /// @returns {Array<Struct.Recipe>}
  recipe_get = function () {
    return _recipies;
  };
}
