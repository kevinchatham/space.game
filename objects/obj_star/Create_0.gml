sprites = [
	spr_star_shine_blue,
	spr_star_shine_blue_mini,
	spr_star_shine_green,
	spr_star_shine_green_mini,
	spr_star_shine_orange,
	spr_star_shine_orange_mini,
	spr_star_shine_pink,
	spr_star_shine_pink_mini
];

index = irandom(array_length(sprites) - 1);
rotation_speed = choose(1, -1) * random_range(0.1, 0.25); // left or right
scale = random_range(0.05, 0.15);

image_alpha = 0.01;
image_xscale = scale;
image_yscale = scale;
sprite_index = sprites[index];
