function create_random_asteroid() {
  var _i;

  //The function tries to generate a random asteroid type up to X times
  //If it succeeds in finding a valid asteroid type based on the rarity condition, it returns a new Asteroid.
  //If no valid asteroid type is found, it defaults to returning an asteroid of the first type in the array.
  repeat (10) {
    _i = irandom(array_count(global.asteroid_types));
    if (irandom(100) <= global.asteroid_types[_i].spawn_chance) {
      return new Asteroid(global.asteroid_types[_i]);
    }
  }

  return new Asteroid(global.asteroid_types[_i]);
}

/// @param {Struct.Item} _item
/// @param {Real} _quantity
function AsteroidNextSpawnType(_item, _quantity) constructor {
  item = _item;
  quantity = _quantity;
}

/// @param {Asset.GMSprite} _sprite_index
/// @param {Real} _max_health
/// @param {Real} _spawn_chance
/// @param {Array<Struct.AsteroidNextSpawnType>} _next_spawns
function AsteroidType(_sprite_index, _max_health, _spawn_chance, _next_spawns) constructor {
  sprite_index = _sprite_index;
  max_health = _max_health;
  spawn_chance = _spawn_chance;
  next_spawns = _next_spawns;
}

/// @param {Struct.AsteroidType} _this
function Asteroid(_this) constructor {
  sprite_index = _this.sprite_index;
  max_health = _this.max_health;
  current_health = _this.max_health;
  next_spawns = _this.next_spawns;
  initial_direction = irandom(360);
  max_rotation_speed = 0.1;
  min_rotation_speed = 0.01;
  min_speed = 0.1;
  rotation_speed = choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);
}

