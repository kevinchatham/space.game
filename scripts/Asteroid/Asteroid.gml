global.asteroid_types = [
  {
    base: spr_asteroid,
    animation: spr_asteroid_explosion,
    max_health: 5,
	rarity:100,
    next_spawn: {
      sprite_index: spr_coal_ore,
      count: irandom_range(1, 5)
    }
  },
  {
    base: spr_asteroid_ice,
    animation: spr_asteroid_ice_explosion,
    max_health: 5,
	rarity:1,
    next_spawn: {
      sprite_index: spr_ice_ore,
      count: irandom_range(1, 5)
    }
  }
];

/// global.asteroid_types[i] _this
/// @param {Any} _this
function Asteroid(_this) constructor {
  /// @type {Asset.GMSprite}
  sprite_index = _this.base;
  /// @type {Asset.GMSprite}
  animation_sprite_index = _this.animation;
  /// @type {Real}
  max_health = _this.max_health;
  /// @type {Real}
  current_health = _this.max_health;
  /// @type {Struct}
  next_spawn = {
    /// @type {Asset.GMSprite}
    sprite_index: _this.next_spawn.sprite_index,
    /// @type {Real}
    count: _this.next_spawn.count
  };
  /// @type {Real}
  initial_direction = irandom(360);
  /// @type {Real}
  max_rotation_speed = 0.1;
  /// @type {Real}
  min_rotation_speed = 0.01;
  /// @type {Real}
  min_speed = 0.1;
  /// @type {Real}
  rotation_speed = choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);
}

function create_random_asteroid() {
  var _i;

  //The function tries to generate a random asteroid type up to X times
  //If it succeeds in finding a valid asteroid type based on the rarity condition, it returns a new Asteroid.
  //If no valid asteroid type is found, it defaults to returning an asteroid of the first type in the array.
  repeat (10) {
    _i = irandom(array_length(global.asteroid_types) - 1);
    if (irandom(100) <= global.asteroid_types[_i].rarity) {
      return new Asteroid(global.asteroid_types[_i]);
    }
  }

  return new Asteroid(global.asteroid_types[_i]);
}
