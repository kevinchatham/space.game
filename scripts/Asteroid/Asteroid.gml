/// @returns {Struct.Asteroid}
function create_random_asteroid() {
  var _i = 0;
  var _asteroid = new Asteroid(global.asteroid_types[_i]);

  // The function tries to generate a random asteroid type up to X times
  // If it succeeds in finding a valid asteroid type based on the rarity condition, it returns a new Asteroid.
  // If no valid asteroid type is found, it defaults to returning an asteroid of the first type in the array.
  repeat (10) {
    _i = irandom(array_count(global.asteroid_types));
    if (irandom(100) <= global.asteroid_types[_i].spawn_chance) {
      _asteroid = new Asteroid(global.asteroid_types[_i]);
    }
  }

  // deep copy to avoid modifying the global struct when updating quantity
  _asteroid = deep_copy(_asteroid);
  for (_i = 0; _i < array_length(_asteroid.next_spawns); _i++) {
    var _quantity = _asteroid.next_spawns[_i].quantity;
    _asteroid.next_spawns[_i].quantity = irandom_range(_quantity - 1, _quantity + 1);
  }

  return _asteroid;
}

/// @param {Asset.GMSprite} _sprite_index
/// @param {Real} _max_health
/// @param {Real} _spawn_chance
/// @param {Array<Struct.InventoryItem>} _next_spawns
function AsteroidOptions(
  _sprite_index,
  _max_health,
  _spawn_chance,
  _next_spawns
) constructor {
  sprite_index = _sprite_index;
  max_health = _max_health;
  spawn_chance = _spawn_chance;
  next_spawns = _next_spawns;
}

/// @param {Struct.AsteroidOptions} _options
function Asteroid(_options) constructor {
  sprite_index = _options.sprite_index;
  max_health = _options.max_health;
  current_health = _options.max_health;
  next_spawns = _options.next_spawns;
  initial_direction = irandom(360);
  max_rotation_speed = 0.1;
  min_rotation_speed = 0.01;
  min_speed = 0.1;
  rotation_speed = choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);
}
