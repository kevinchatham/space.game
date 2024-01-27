sprites = [
  spr_planet,
  spr_planet_clouds_only_1,
  spr_planet_unstable_1,
  spr_planet_lava_3,
  spr_planet_ice_4,
  spr_planet_ring_1,
  spr_planet_bryce,
  spr_planet_black_hole_light_blue,
  spr_planet_weird_3,
  spr_planet_sand_1,
  spr_planet_ring_2,
  spr_planet_lava_2,
  spr_planet_clouds_only_4_purple
];

index = irandom(array_length(sprites) - 1);
rotation_speed = choose(1, -1) * random_range(0.01, 0.025); // left or right
scale = random_range(0.5, 1.75);

image_xscale = scale;
image_yscale = scale;
sprite_index = sprites[index];
