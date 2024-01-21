sprites = [
  spr_planet,
  spr_planet_clouds_only_1,
  spr_planet_unstable_1,
  spr_planet_lava_3,
  spr_planet_ice_4,
  spr_planet_ring_1,
  spr_bryce_planet
];

index = irandom(array_length(sprites) - 1);
rotation_speed = choose(1, -1) * random_range(0.01, 0.025); // left or right
scale = random_range(0.75, 1.5);

image_xscale = scale;
image_yscale = scale;
sprite_index = sprites[index];
