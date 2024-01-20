/// @type _this
// {
//   base: Asset.GMSprite,
//   animation: Asset.GMSprite,
//   next_spawn: {
//     sprite_index: Asset.GMSprite,
//     count: Real
//   }
// }
function Asteroid (_this) constructor {
   sprite_index = _this.base;
   animation_sprite_index = _this.animation
   next_spawn = {
	sprite_index: _this.next_spawn.sprite_index,
	count: _this.next_spawn.count
   }
   initial_direction = random(360);
   max_rotation_speed = 0.1;
   min_rotation_speed = 0.01;
   min_speed = 0.1;
   rotation_speed = choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);
}

function create_random_asteroid(){
    var _i = irandom(array_length(global.asteroid_types) - 1);
    return new Asteroid(global.asteroid_types[_i]);
}

global.asteroid_types = [
  {
    base: spr_asteroid,
    animation: spr_asteroid_explosion,
	next_spawn: {
      sprite_index: spr_coal_ore,
      count: irandom_range(1,5)
	}
  },
  {
    base: spr_asteroid_ice,
    animation: spr_asteroid_ice_explosion,
	next_spawn: {
		sprite_index: spr_ice_ore,
		count: irandom_range(1,5)
	}
  }
];