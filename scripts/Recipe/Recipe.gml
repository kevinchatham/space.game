/// @param {String} _display_name
/// @param {Array<Struct.InventoryItem>} _requirements
/// @param {Array<Struct.InventoryItem>} _products
/// @param {Asset.GMSprite} _sprite
function Recipe(_display_name, _requirements, _products, _sprite) constructor {
  display_name = _display_name;
  requirements = _requirements;
  products = _products;
  sprite = _sprite;
}

/// @param {Array<Struct.Recipe>} _recipies
function Station(_recipies) constructor {
  /// @type {Array<Struct.Recipe>}
  recipies = _recipies;

  /// @param {String} _name
  recipe_find_index = function (_name)  {
    for (var _i = 0; _i < array_length(recipies); _i++) {
      if (_name == recipies[_i].display_name) {
        return _i;
      }
    }

    return -1;
  };

  /// @param {Struct.Recipe} _recipe
  recipe_add = function (_recipe) {
    array_push(recipies, _recipe);
  };

  /// @param {Struct.Recipe} _recipe
  /// @param {Struct.Inventory>} _inventory
  recipe_craft = function (_recipe, _inventory) {
    var _meets_requirements = false;
    for (var _i = 0; _i < array_length(_recipe.requirements); _i++) {
      var _requirement = _recipe.requirements[_i];
      _meets_requirements = _inventory.inventory_has(_requirement.item, _requirement.quantity);
      if (!_meets_requirements) break;
    }

    if (_meets_requirements) {
      for (var _i = 0; _i < array_length(_recipe.requirements); _i++) {
        _inventory.inventory_subtract(
          _recipe.requirements[_i].item,
          _recipe.requirements[_i].quantity
        );
      }

      for (var _i = 0; _i < array_length(_recipe.products); _i++) {
        _inventory.inventory_add(_recipe.products[_i].item, _recipe.products[_i].quantity);
      }
    }

    return _inventory;
  };

  /// @returns {Array<Struct.Recipe>}
  recipe_list = function () {
    return recipies;
  };
}
