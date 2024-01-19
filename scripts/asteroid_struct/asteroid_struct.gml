/// @type _this
// {
//   base: spr_asteroid,
//   animation: spr_asteroid_explosion
//   next_spawn: obj_dirt
// }
function asteroid (_this) constructor {
   sprite_index = _this.base;
   animation_sprite_index = _this.animation
   initial_direction = random(360);
   max_rotation_speed = 0.1;
   min_rotation_speed = 0.01;
   min_speed = 0.1;
   rotation_speed = choose(1, -1) * random_range(min_rotation_speed, max_rotation_speed);
}

function create_random_asteroid(){
    var _i = irandom(array_length(global.asteroid_types) - 1);
    return new asteroid(global.asteroid_types[_i]);
}

global.asteroid_types = [
  {
    base: spr_asteroid,
    animation: spr_asteroid_explosion
  },
  {
    base: spr_asteroid_ice,
    animation: spr_asteroid_ice_explosion
  }
];