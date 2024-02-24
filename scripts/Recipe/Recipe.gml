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

/// @param {Array<Struct.Recipe>} _recipies
/// @param {Real} _slot_count
function Recipes(_recipies, _slot_count): Inventory(_slot_count) constructor {
  /// @type {Array<Struct.Recipe>}
  recipies = [];

  /// @param {String} _name
  recipe_find = function (_name) {
    for (var _i = 0; _i < array_length(recipies); _i++) {
      if (_name == recipies[_i].name) {
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
    array_push(recipies, {
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
        _requirement_index < array_length(recipies[_index].requirements);
        _requirement_index++
      ) {
        if (
          item_has(
            recipies[_index].requirements[_requirement_index].name,
            recipies[_index].requirements[_requirement_index].quantity
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
          _requirement_index < array_length(recipies[_index].requirements);
          _requirement_index++
        ) {
          item_subtract(
            recipies[_index].requirements[_requirement_index].name,
            recipies[_index].requirements[_requirement_index].quantity
          );
        }

        var _item = new InventoryItem(
          recipies[_index].product.name,
          recipies[_index].product.quantity,
          recipies[_index].product.sprite
        );
        item_add(_item);
      }
    }
  };

  /// @returns {Array<Struct.Recipe>}
  recipe_get = function () {
    return recipies;
  };
}
